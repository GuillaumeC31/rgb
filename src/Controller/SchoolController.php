<?php

namespace App\Controller;


use App\Entity\Users;
use App\Entity\School;
use App\Entity\Messages;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\Mapping;
use Respect\Validation\Validator as v;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Doctrine\ORM\EntityManager ;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;


class SchoolController extends AbstractController
{
    const ALLOW_CHARS = 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØŒŠþÙÚÛÜÝŸàáâãäåæçèéêëìíîïðñòóôõöøœšÞùúûüýÿß%- ';


    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
      $this->passwordEncoder = $passwordEncoder;
    }

    /**
     * @Route("/school/index", name="school_index")
     */
    public function indexSearch()
    {

         return $this->render('school/index.html.twig', [
                 'userFound' => $userFound ?? null,

        ]);
    }

/*************************************AFFICHAGE DES UTILISSATEURS**************************************************/
     /**
     * @Route("/school/list_valid", name="list_valid")
     */
    public function list()
    {
        $repository = $this->getDoctrine()->getRepository(Users::class);

        $studentList = $repository->findAllByRole('ROLE_STUDENT');
        $entList = $repository->findAllByRole('ROLE_ENTREPRISE');

        return $this->render('school/list_valid.html.twig', [
            'studentList' => $studentList,
            'entList'     => $entList,
        ]);
    }
    /************************AFFICHE MESSAGE***********************************************/
     /**
     * @Route("/school/list_message", name="list_message")
     */
    public function listMessage()
    {
    	$repository = $this->getDoctrine()->getRepository(Messages::class);
        $mesStudent = $repository->findAllWithUsers();

        return $this->render('school/list_message.html.twig', [
			'messages' => $mesStudent,
        ]);
    }
    /**************************MODIFIER ELEVES*******************************************/

     /**
     *
     * @Route("/school/modif_student/{id}", name="modif_student")
     */
    public function modiffStudent( int $id)
    {

        $repositoryUser = $this->getDoctrine()->getRepository(Users::class);
        $oldUser = $repositoryUser->find($id);

        $post = [];
        $errors = [];

        if(!empty($_POST)){
            $post = array_map('trim', array_map('strip_tags', $_POST));


            if(!empty($post['address']) && !v::notEmpty()->length(2,null)->validate($post['address'])){
                $errors[] = 'Adresse invalide';
            }
            if(!empty($post['zipcode']) && !v::notEmpty()->length(2,null)->validate($post['zipcode'])){
                $errors[] = 'le code postal est invalide';
            }
            if(!empty($post['city']) && !v::notEmpty()->length(2,null)->validate($post['city'])){
                $errors[] = 'la ville est invalide';
            }

            if(!empty($post['phone']) && !v::notEmpty()->phone()->validate($post['phone'])){
                $errors[] = 'Le téléphone est invalide';
            }

            if(!empty($post['email']) && !v::notEmpty()->email()->validate($post['email'])){
                $errors[] = 'Votre email est invalide';
            }

            if(!empty($post['web']) && !v::length(0,null)->validate($post['web'])){
                $errors[] = 'Votre site web n\'est invalide';
            }

            if(!empty($post['github']) && !v::length(0,null)->validate($post['github'])){
                $errors[] = 'Votre github n\'est invalide';
            }

            if(count($errors) === 0){
                $formValid = true ;

                $entityManager = $this->getDoctrine()->getManager();
                $user = $entityManager->getRepository(Users::class)->find($id);

                $user->setAddress($post['address']);
                $user->setZipcode($post['zipcode']);
                $user->setCity($post['city']);
                $user->setPhone($post['phone']);
                $user->setEmail($post['email']);
                $user->setWeb($post['web']);
                $user->setGithub($post['github']);
                $user->setDateRegistration(new \dateTime('now'));
                $user->setRoles(['ROLE_STUDENT']);
                $user->setUserId('0');
                $user->setPhotoProfileId('0');

                $entityManager->flush();

                //return $this->redirectToRoute('school/list_valid.html.twig');
             }
            else {
                $formValid = false;
                    }
            }
                return $this->render('school/modif_student.html.twig', [
                    'formValid'    => $formValid ?? null,
                    'errors'    => $errors ?? [] ,
                    'user' => $oldUser,
                ]);
    }

    /****************************MODIFIER ENTREPRISE*************************************************/
     /**
     * @Route("/school/modif_ent/{id}", name="modif_ent")
     *
     */
    public function modifEnt(int $id)
    {

        $repositoryUser = $this->getDoctrine()->getRepository(Users::class);
        $ent = $repositoryUser->find($id);


        return $this->render('school/modif_ent.html.twig' ,[

            'formValid'      => $formValid ?? null,
            'errors'         => $errors ?? [] ,

        ]);
    }
    /*****************************AJOUT ENTREPRISE***********************************************/
     /**
     *
     * @Route("/school/add_ent", name="add_ent")
     */
    public function addEnt(MailerInterface $mailer)
     {
        $post = [];
        $errors = [];

            if(!empty($_POST)){
                    $post = array_map('trim', array_map('strip_tags', $_POST));

                    if(!v::notEmpty()->length(2,null)->alpha(self::ALLOW_CHARS)->validate($post['name_ent'])){
                        $errors[] = 'Le nom  d\'entreprise est invalide';
                    }
                     if(!v::notEmpty()->length(2,null)->validate($post['address_pro'])){
                    $errors[] = 'Adresse invalide';
                    }
                    if(!v::notEmpty()->alnum()->length(5,null)->validate($post['zipcode_pro'])){
                        $errors[] = 'Le code postale est invalide';
                    }
                     if(!v::notEmpty()->numeric()->length(9,14)->validate($post['num_siret'])){
                        $errors[] = 'Votre numéro de SIRET est invalide';
                    }
                    if(!v::notEmpty()->email()->validate($post['email'])){
                        $errors[] = 'Votre email est invalide';
                    }
                     if(!v::notEmpty()->length(2, null)->validate($post['password'])){
                        $errors[] = 'Votre mot de passe est erroné!';
                    }
                    if($post['password'] !== $post['passwordConfirm']){
                        $errors[] = 'les mots de passe ne sont pas identiques';
                    }

            if(count($errors) === 0){
                $formValid = true ;

                $ent = new Users();

                $ent->setIdentity($post['name_ent']);
                $ent->setSiret($post['num_siret']);
                $ent->setAdressPro($post['address_pro']);
                $ent->setZipcodePro($post['zipcode_pro']);
                $ent->setEmail($post['email']);
                $ent->setPassword($this->passwordEncoder->encodePassword($ent, $post['password']));
                $ent->setDateRegistration(new \dateTime('now'));
                $ent->setRoles(['ROLE_ENTREPRISE']);
                $ent->setUserId("0");
                $ent->setPhotoProfileId("0");

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($ent);
                $entityManager->flush();

                $message = '<p>Bonjour '.$post['name_ent'].',';
                $message.= '<br> Bienvenue sur la plateforme RGB :';
                $message.= '<br> Merci pour votre inscription, veuillez retrouver vos identifiants ci-dessous :';
                $message.= '<br> login : '.$post['email'];
                $message.= '<br> mot de passe : '.$post['password'];
                $message.= '<br>A très bientôt sur RGB.';
                $message.= '</p>';

                $email = new Email();
                $email->from('Papercut@papercut.com');
                $email->to('alexanderfry@live.fr');
                $email->replyTo($post['email']);
                $email->subject('[Contact du site ] Nouveau message du site le '.date('d/m/Y H:i'));
                $email->text('RGB vous souhaite la bienvenue');
                $email->html($message);

                $sentEmail = $mailer->send($email);

          }
            else {
                $formValid = false;
            }
        }
         return $this->render('school/add_ent.html.twig', [
              'post'          => $post ?? [],
            'status_form'     =>  $formValid ?? null,
            'errors_form'     =>  $errors ,
        ]);
    }

    /**********************************************AJOUT ELEVES******************************************/
    /**
     *
     * @Route("/school/add_student", name="add_student")
     */
    public function addStudent(MailerInterface $mailer)
     {
        $post = [];
        $errors = [];

            if(!empty($_POST)){
                    $post = array_map('trim', array_map('strip_tags', $_POST));

                    if(!v::notEmpty()->length(2,null)->alpha(self::ALLOW_CHARS)->validate($post['firstname'])){
                        $errors[] = 'Prénom est invalide';
                    }
                     if(!v::notEmpty()->length(2,null)->validate($post['lastname'])){
                    $errors[] = 'Nom invalide';
                    }
                     if(!empty($post['address']) && !v::notEmpty()->length(5,null)->validate($post['address'])){
                    $errors[] = 'Adresse invalide';
                    }
                     if(!empty($post['city']) && !v::notEmpty()->length(2,null)->validate($post['city'])){
                    $errors[] = 'Ville invalide';
                    }
                     if(!empty($post['phone']) && !v::notEmpty()->alnum()->length(10,null)->validate($post['phone'])){
                        $errors[] = 'Le Numéro de téléphone est invalide';
                    }
                    if(!empty($post['zipcode']) && !v::notEmpty()->alnum()->length(5,null)->validate($post['zipcode'])){
                        $errors[] = 'Le code postale est invalide';
                    }
                     if(!empty($post['birthdate']) && !v::notEmpty()->date()->validate($post['birthdate'])){
                        $errors[] = 'Date de naissance est invalide';

                    }
                    if(!empty($post['mark']) && !v::notEmpty()->numeric()->length(2,null)->validate($post['mark'])){
                        $errors[] = 'Moyenne des notes est invalide';
                    }
                    if(!v::notEmpty()->email()->validate($post['email'])){
                        $errors[] = 'Votre email est invalide';
                    }
                     if(!empty($post['password']) && !v::notEmpty()->length(8, null)->validate($post['password'])){
                        $errors[] = 'Votre mot de passe est erroné!';
                    }
                    if($post['password'] !== $post['passwordConfirm']){
                        $errors[] = 'les mots de passe ne sont pas identiques';
                    }

            if(count($errors) === 0){
                $formValid = true ;

                $student = new Users();

                $student->setFirstname($post['firstname']);
                $student->setLastname($post['lastname']);
                $student->setAddress($post['address']);
                $student->setZipcode($post['zipcode']);
                $student->setCity($post['city']);
                $student->setPhone($post['phone']);
                $student->setBirthdate(new \DateTime($post['birthdate']));
                $student->setEmail($post['email']);
                $student->setPassword($this->passwordEncoder->encodePassword($student, $post['password']));
                $student->setDateRegistration(new \dateTime('now'));
                $student->setRoles(['ROLE_STUDENT']);
                $student->setUserId("0");
                $student->setPhotoProfileId("0");

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($student);
                $entityManager->flush();

                $message = '<p>Bonjour '.$post['firstname'].' '.$post['lastname'].',';
                $message.= '<br> Bienvenue sur la plateforme RGB :';
                $message.= '<br> Merci pour votre inscription, veuillez retrouver vos identifiants ci-dessous :';
                $message.= '<br> login : '.$post['email'];
                $message.= '<br> mot de passe : '.$post['password'];
                $message.= '<br>A très bientôt sur RGB.';
                $message.= '</p>';

                $email = new Email();
                $email->from('Papercut@papercut.com');
                $email->to('alexanderfry@live.fr');
                $email->replyTo($post['email']);
                $email->subject(' Votre demande a bien été validé le :'.date('d/m/Y H:i'));
                $email->text('RGB vous souhaite la bienvenue');
                $email->html($message);

                $sentEmail = $mailer->send($email);

          }
            else {
                $formValid = false;
            }
        }
         return $this->render('school/add_student.html.twig', [
            'post'          => $post ?? [],
            'status_form'   => $formValid ?? null,
            'errors_form'   => $errors ,
        ]);
    }
    /****************************************VUE STUDENT***********************************/
    /**
     * @Route("/school/view_student/{id}", name="view_student")
     *
     */
    public function viewStudent(int $id)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usersStudent = $entityManager->getRepository(Users::class)->find($id);

        return $this->render('school/view_student.html.twig',  [
            'users'    => $usersStudent
            ,

        ]);
    }
    /**************************VUE ENTREPRISE***********************************************************************/
    /**
     * @Route("/school/view_ent/{id}", name="view_ent")
     *
     */
    public function viewEntreprise(int $id)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $usersEnt = $entityManager->getRepository(Users::class)->find($id);

        $repositoryUser = $this->getDoctrine()->getRepository(Users::class);
        $entAccept = $repositoryUser->find($id);

        if ($entAccept->getConnect() == 'true') {
            $entAccept = 'checked';

        }
          else {
            $entAccept = '';

         }
        return $this->render('school/view_ent.html.twig' ,[
             'users'         => $usersEnt,
             'viewAccept'    => $entAccept,

        ]);
    }
/****************************VUE MESSAGE*******************************************************/
    /**
     * @Route("/school/view_message/{id}", name="view_message")
     *
     */
    public function viewMessage(int $id)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $messStudent = $entityManager->getRepository(Messages::class)->find($id);

        return $this->render('school/view_message.html.twig',  [
            'mess'    => $messStudent,
        ]);
    }
/************************************SUPP ENTREPRISE*********************************************************/
    /**
     * @Route("/delete_ent/{id}", name="delete_ent")
     */
    public function deleteEnt(int $id)
    {

    	$entityManager = $this->getDoctrine()->getManager();
        $users = $entityManager->getRepository(Users::class)->find($id);


        if(!empty($_POST)){

            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(isset($post['delete']) && $post['delete'] == 'yes'){
                $entityManager->remove($users);
                $entityManager->flush();
                $this->redirectToRoute('list_valid');
            }

        }

        return $this->render('school/delete_ent.html.twig', [
        	'users' => $users,
        ]);
    }
/******************************SUPP ELEVES***************************************************************/
    /**
     * @Route("/delete_student/{id}", name="delete_student")
     */
    public function deleteStudent(int $id)
    {

    	$entityManager = $this->getDoctrine()->getManager();
        $users = $entityManager->getRepository(Users::class)->find($id);


        if(!empty($_POST)){

            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(isset($post['delete']) && $post['delete'] == 'yes'){
                $entityManager->remove($users);
                $entityManager->flush();
                $this->redirectToRoute('list_valid');
            }

        }

        return $this->render('school/delete_student.html.twig', [
             'users' => $users,

        ]);
    }

    /**
     * Permet de valider manuellement une entreprise via Ajax
     * @Route("/ajax/validate-ape-entreprise", name="validate_ape_entreprise")
     */
    public function ajaxValidateApeEntreprise(MailerInterface $mailer)
    {

        if(!empty($_POST)){
            $post = array_map('trim', array_map('strip_tags', $_POST));

            // Je vérifie que le statut est bien défini et non vide.
            // Pareil pour l'id_entreprise et en plus je m'assure que ça soit un numerique
            if(isset($post['new_status']) && !empty($post['new_status'])
                && isset($post['id_entreprise']) && !empty($post['id_entreprise']) && is_numeric($post['id_entreprise'])){


                $entityManager = $this->getDoctrine()->getManager();
                // $currentEntreprise contient les données de l'entreprise sélectionnée
                $currentEntreprise = $entityManager->getRepository(Users::class)->find((int) $post['id_entreprise']);

                    if(!empty($currentEntreprise)){

                            $message = '<p>Bonjour '.$currentEntreprise->getIdentity().',';
                            $message.= '<br> Bienvenue sur la plateforme RGB :';
                         // $message.= '<br> Merci pour votre inscription, veuillez retrouver vos identifiants ci-dessous :';
                            $message.= '<br> login : '.$currentEntreprise->getEmail();
                            $message.= '<br> votre mot de passe sera le meme que lors de votre inscription';
                            $message.= '<br>A très bientôt sur RGB.';
                            $message.= '</p>';


                            $email = new Email();
                            $email->from('Papercut@papercut.com');
                            $email->to('alexanderfry@live.fr');
                            $email->replyTo($currentEntreprise->getEmail());
                            $email->subject('Nouveau message du site le '.date('d/m/Y H:i'));
                            $email->text('RGB vous souhaite la bienvenue');
                            $email->html($message);

                            $sentEmail = $mailer->send($email);



                            $currentEntreprise->setConnect($post['new_status']);
                            $entityManager->flush();

                    return $this->json([
                        'status'   => 'ok mise à jour valide',

                    ]);
                 }
            }
        }

    }




}
