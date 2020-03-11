<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Respect\Validation\Validator as v;
use App\Entity\Messages;
use App\Entity\Users;
use App\Entity\Uploads;
use Behat\Transliterator\Transliterator as tr;
use Intervention\Image\ImageManager;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;


class StudentController extends AbstractController
{
    // /**
    //  * @Route("/student/", name="student_home")
    //  */
    // public function index()
    // {

    //         $post = []; // pas necessaire si on utilise array_map();
    //         $errors = [];
    //         if (!empty($_POST)) {
    //             $post = array_map('trim', array_map('strip_tags', $_POST)); //Nettoie les données remplace le foreach de nettoyage
    //             if (!v::notEmpty()->length(2, null)->alnum()->validate($post['title'])) {
    //                         $errors[] = 'Votre titre est invalide';
    //             }
                        
    //             if (!v::notEmpty()->length(2, null)->alnum()->validate($post['content'])) {
    //                         $errors[] = 'Votre résumé est invalide';
    //             }
                
    //             //$entityManager = $this->getDoctrine()->getManager();
    //             // $user = new Users();
    //             // $messages->setTitle($post['title']);
    //             // $messages->setContent($post['content']);
    //             // // tell Doctrine you want to (eventually) save the messages (no queries yet)
    //             // $entityManager->persist($messages);

    //             // // actually executes the queries (i.e. the INSERT query)
    //             // $entityManager->flush();
                
                

    //         }

    //         $users = $this->getDoctrine()->getRepository(Users::class)->findAll();
          
    //         $tableauID = [];
    //         foreach ($users as $key => $user) {
    //             $user;
    //             $superkey = dump($user);
    //             $tableauID = $superkey; 
    //         }
    //         $superkey;

     

    //         $usersID = $this->getDoctrine()->getRepository(Users::class)->find(5);

    //         $messagesRecus = $this->getDoctrine()->getRepository(Messages::class)->findByExampleField(2);

    //     return $this->render('student/index.html.twig', [
    //             'errors' => $errors ?? null,
    //             'users' => $users,
    //             'key' => $key,
             
    //     ]);
        
        
    // }//Fermeture index


    /**
     * @Route("/student", name="student_home")
     */
    public function index(MailerInterface $mailer){

        if($this->getUser()){
            $id = $this->getUser()->getId(); 
            $post = $errors = [];
        }

        $mimeTypesAllowed = [
            'png', 'gif', 'jpeg','jpg', 'pjpeg',
            'plain','pdf','css','html'
        ];

        $maxSize = 10 * 1000 * 1000; 

        if(!empty($_POST)){

            foreach($_POST as $key => $value){
                $post[$key] = trim(strip_tags($value));
            }

            if($post['action'] == 'sendfile'){
                

                if(!v::notEmpty()->alnum('-')->length(2, null)->validate($post['title_upload'])){
                    $errors[] = 'Votre titre doit comporter au moins 2 caractères et uniquement chiffres lettres et tiret (-)';
                }

                if(!empty($_FILES) && !empty($_FILES['upload_image'])){
                
                    $rootFolder = $_SERVER['DOCUMENT_ROOT'];
                    $uploadDir = 'assets/uploads/';
            
                    $fileinfo = pathinfo($_FILES['upload_image']['name']); 
                
                    $mimeTypeDeMonFichierActuel = $fileinfo['extension']; 
                    if(in_array($mimeTypeDeMonFichierActuel, $mimeTypesAllowed)){

                        if($_FILES['upload_image']['size'] < $maxSize){

                            $chars_search = [' ', 'é', 'è', 'à', 'ù'];
                            $chars_replace= ['-', 'e', 'e', 'a', 'u'];

                            $finalFileName = str_replace($chars_search, $chars_replace, time().'-'.$_FILES['upload_image']['name']);
                            $finalFileName.= tr::transliterate($finalFileName);

                            if(!is_dir($uploadDir)){ 
                                if(!mkdir($uploadDir, 0777)){ 
                                    $errors[] = 'Un problème est survenu lors de la création du répértoire d\'upload';
                                }
                            }


                            $destination = $rootFolder.$uploadDir.$finalFileName; 

                            move_uploaded_file($_FILES['upload_image']['tmp_name'], $destination);

                        }
                        else {
                            $errors[] = 'Votre fichier est trop lourd (10Mo maxi)';
                        }

                    }
                    else {
                        $errors[] = 'Ce type de fichier n\'est pas autorisé';
                    }

        
                    if (count($errors) == 0) {
                        $formValid = true;
                        $entityManager = $this->getDoctrine()->getManager();
                        $upload = new Uploads();
                        $user = new Users();
                        $userTable = $entityManager->getRepository(Users::class)->findAll();
                        foreach ($userTable as $userTTAABLE) {
                                $userId = $userTTAABLE->getId($id);
                        }
                        $upload->setUserId($userId);
                        $upload->setTitle($post['title_upload']);
                        $upload->setFilePath($finalFileName);
                        $upload->setCreatedAt(new \DateTime('now'));
                    
                        $entityManager->persist($upload);

                        $entityManager->flush();

                        return $this->redirectToRoute('student_home_home');
                

                    }//Fermeture COUNT ERROR
                    else {
                        $formValid = false;
                    }
                }//Fermeture not empty FILES

            }//Fermeture if $post['action'] == 'sendfile'
            elseif($post['action'] == 'sendmessage'){
              
            
                $entityManager = $this->getDoctrine()->getManager();
                $messages = new Messages;
    
                $messages->setUserId($this->getUser()->getId());
                $messages->setCreatedAt(new \DateTime('now'));
                if (!empty($post['content']) || !empty($post['title'])) {
                
                    $messages->setContent($post['content']);
                    $messages->setTitle($post['title']);
                }
                
                $entityManager->persist($messages);
                $entityManager->flush();
                    
                
                $uploads = $entityManager->getRepository(Uploads::class)->findAll();
                $users = $entityManager->getRepository(Users::class)->findAll();
        
                foreach ($users as $user) {
                    $userConnected = $user;
                }
                $userId = $userConnected->getUserId() ;
                $uploadUser = $entityManager->getRepository(Uploads::class)->find($userId);
                $filePath = $uploadUser->getFilePath();

                $mail = '<p>Bonjour '. $this->getUser()->getFirstname();
                $mail.= ', vous allez bien j\'espère.';
                $mail.= '<br> Votre contenu :' .'<span style="font-weight:italic"><i>'  . $post['content'].'.'.'</i></span>';
                $mail.= ' A été envoyé à l\'administration !';
                $mail.= '<br>A très bientôt sur RGB.';
                $mail.= '</p>';


                $email = (new Email())
                    ->from('hello@rgb.fr')
                    ->to('you@example.fr')
                    ->subject('Votre email à été envoyé à l\'administration !' )
                    ->text(strip_tags($mail))
                    ->html($mail);

                $sentEmail = $mailer->send($email);
        
                return $this->render('student/index.html.twig', [
                    //'errors' => $messages ?? null, 
                    'id' => $id, 
                    'uploads' => $uploads,
                    'filePath' => $filePath,
                ]);
            }
        }//Fermeture not empty POST

        
        $entityManager = $this->getDoctrine()->getManager();
        $uploads = $entityManager->getRepository(Uploads::class)->findAll();
        
        $userId = $this->getUser()->getId() ;
        $uploadUser = $entityManager->getRepository(Uploads::class)->find($userId);
        $filePath = $uploadUser->getFilePath();
        $idMessage = 7;
        $messages = $entityManager->getRepository(Messages::class)->searchUserIdMessages(7);
       

     
  
        $reception = $messages; 

        return $this->render('student/index.html.twig', [
            'errors' => $errors ?? null,  
            'uploads' => $uploads ?? null ,
            'id' => $id ?? null, 
            'userId' => $userId,
            'uploadUser' => $uploadUser,
            'filePath' => $filePath,
            'reception' => $reception
        ]);


    }//Fermeture function INDEX
 

     /**
     * @Route("/student-update", name="student_update")
     */
    public function profileUpdate(){
        $errors = [];
        $mimeTypesAllowed = [
        'png', 
        'gif', 
        'jpeg', 
        'jpg', 
        'pjpeg',
        'webp'
        ];

        $maxSize = 10 * 1000 * 1000; 

        if (!empty($_POST)) {
           
            
        }//Fermeture not empty POST
      
        if (!empty($_FILES) && !empty($_FILES['profilePhoto'])) {
        
            $rootFolder = $_SERVER['DOCUMENT_ROOT'];
                    $uploadDir = 'assets/uploads/';
            
                    $fileinfo = pathinfo($_FILES['profilePhoto']['name']); 
                
                    $mimeTypeDeMonFichierActuel = $fileinfo['extension']; 
                        if(in_array($mimeTypeDeMonFichierActuel, $mimeTypesAllowed)){

                                    if($_FILES['profilePhoto']['size'] < $maxSize){

                                        $chars_search = [' ', 'é', 'è', 'à', 'ù'];
                                        $chars_replace= ['-', 'e', 'e', 'a', 'u'];

                                        $finalFileName = str_replace($chars_search, $chars_replace, time().'-'.$_FILES['profilePhoto']['name']);

                                        if(!is_dir($uploadDir)){ 
                                            if(!mkdir($uploadDir, 0777)){ 
                                                $errors[] = 'Un problème est survenu lors de la création du répértoire d\'upload';
                                            }
                                        }


                                        $destination = $rootFolder.$uploadDir.$finalFileName; 

                                        move_uploaded_file($_FILES['profilePhoto']['tmp_name'], $destination);

                                    }
                                    else {
                                        $errors[] = 'Votre fichier est trop lourd (10Mo maxi)';
                                    }

                                }
                                else {
                                    $errors[] = 'Ce type de fichier n\'est pas autorisé';
                                }   
                     
             if (count($errors) == 0) {
        
                    $formValid = true;
                    $entityManager = $this->getDoctrine()->getManager();
                    $upload = new Uploads();
                    $user = new Users();
                    $userTable = $entityManager->getRepository(Users::class)->findAll();
                    foreach ($userTable as $userTTAABLE) {
                            $userId = $userTTAABLE->getId();
                            $userUsername = $userTTAABLE->getfirstname();
                    }
                    $upload->setUserId($this->getUser()->getId());
                    $upload->setTitle('Photo de profil de '.$userUsername );
                    $upload->setFilePath($finalFileName);
                    $upload->setCreatedAt(new \DateTime('now'));
                
                    $entityManager->persist($upload);

                    $entityManager->flush();

                }else {
                    $formValid = false;
                }//Fermeture COUNT ERROR
                
        }//Fermeture not EMPTYFILES 
         
   

    
        return $this->render('student/update.html.twig', [
        //'errors' => $messages ?? null,  
       // 'uploads' => $uploads,
        
       
        ]);//Return Function profileUpdate
    }
    





}//Fermeture controller

