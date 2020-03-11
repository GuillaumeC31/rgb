<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Respect\Validation\Validator as v;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use App\Entity\Entreprise;
use App\Entity\Section;
use App\Entity\School;
use App\Entity\Users;
use App\Entity\Langages;
use App\Entity\Framework;
use App\Entity\EntStudAccept;
use App\Entity\Uploads;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

use Symfony\Bridge\Doctrine\Form\Type;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType as ck;


class EntrepriseController extends AbstractController
{

    const ALLOW_CHARS = 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØŒŠþÙÚÛÜÝŸàáâãäåæçèéêëìíîïðñòóôõöøœšÞùúûüýÿß%- ';

    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
      $this->passwordEncoder = $passwordEncoder;
    }

    /**
     * @Route("/entreprise", name="indexEnt")
     *
     * @IsGranted("ROLE_ENTREPRISE")
     */
    public function entreprise()
    {
        $this->denyAccessUnlessGranted('ROLE_ENTREPRISE', 'ROLE_ADMIN');
        $users = $this->getUser();

        $entityManager = $this->getDoctrine()->getManager();
        $indexSchool = $entityManager->getRepository(Users::class)->findAllByRole('ROLE_SCHOOL');
        $indexStudent = $entityManager->getRepository(USers::class)->findAllByRole('ROLE_STUDENT');
        $indexFormation = $entityManager->getRepository(Section::class)->findAll();
        $indexLangages = $entityManager->getRepository(Langages::class)->findAll();
        $indexFramework = $entityManager->getRepository(Framework::class)->findAll();


        return $this->render('entreprise/index.html.twig', [
            'indexSchool' => $indexSchool,
            'indexStudent' => $indexStudent,
            'indexFormation' => $indexFormation,
            'indexLangages' => $indexLangages,
            'indexFramework' => $indexFramework,
        ]);
    }


    /**
     * @Route("/entreprise/ficheEtudiant", name="ficheEtu")
     */
    public function ficheEtu()
    {
        $users = $this->getUser();
        $entityManager = $this->getDoctrine()->getManager();
        $studentList = $entityManager->getRepository(Users::class)->findAllByRole('ROLE_STUDENT');
        $sectionList = $entityManager->getRepository(Section::class)->findAll();

        $userId = $this->getUser()->getId();
        $filePath = $entityManager->getRepository(Users::class)->findAll($userId);

        $photoEtu = $entityManager->getRepository(Uploads::class)->findAll($filePath);


        return $this->render('entreprise/ficheEtu.html.twig', [
            'studentList' => $studentList,
            'sectionList' => $sectionList,
            'filePath' => $filePath,
        ]);
    }


    /**
     * @Route("/entreprise/ficheEtudiant/view/{id}", name="viewStu")
     */
    public function viewStudent(int $id)
    {

        $entityManager = $this->getDoctrine()->getManager();
        $viewStudent = $entityManager->getRepository(Users::class)->find($id);

        $findOneBy = array('stud_id' => $id, 'ent_id' => $this->getUser()->getId());
        $viewAccept = $entityManager->getRepository(EntStudAccept::class)->findOneBy($findOneBy);

        if ($viewAccept->getAccept() == 'true') {
            $viewAccept = 'checked';
            $img = 'on';
        } else {
            $viewAccept = '';
            $img = 'off';
        }
        //dump($viewAccept);
        //die;

        return $this->render('entreprise/view.html.twig', [
            'view_student'  => $viewStudent,
            'viewAccept' => $viewAccept,
            'img' => $img,
        ]);
    }


    /**
     * @Route("/entreprise/ficheEcole", name="ficheSchool")
     */
    public function ficheSchool()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $schoolIdentity = $entityManager->getRepository(Users::class)->findAllByRole('ROLE_SCHOOL');

        return $this->render('entreprise/ficheEco.html.twig', [
            'schoolIdentity' => $schoolIdentity,
        ]);
    }

    /**
     * @Route("/entreprise/ficheEcole/view/{id}", name="viewSchool")
     */
    public function viewSchool()
    {
        return $this->render('entreprise/view.html.twig', [

        ]);
    }


    /**
     * @Route("/entreprise/ficheEntreprise", name="ficheEnt")
     */
    public function ficheEnt()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $ficheEnt = $entityManager->getRepository(Users::class)->findAll();




        return $this->render('entreprise/ficheEnt.html.twig', [
            'ficheEnt' => $ficheEnt,

        ]);
    }

    /**
     * @Route("/entreprise/ficheEntreprise/modif/{id}", name="modifficheEnt")
     */
    public function modifFicheEnt(int $id)
    {
        $post = [];
        $errors = [];


        $entityManager = $this->getDoctrine()->getManager()->getRepository(Users::class);
        $ficheEntUpdate = $entityManager->find($id);

        if (!empty($_POST)) {
            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(!empty($post['firstnameModif']) && !v::length(2,null)->validate($post['firstnameModif'])){
                $errors[] = 'Le prénom est invalide';
            }
            if(!empty($post['lastnameModif']) && !v::length(2,null)->validate($post['lastnameModif'])){
                $errors[] = 'Le nom est invalide';
            }
            if(!empty($post['addressModif']) && !v::length(2,null)->validate($post['addressModif'])){
                $errors[] = 'Adresse invalide';
            }
            if(!empty($post['zipcodeModif']) && !v::length(2,null)->validate($post['zipcodeModif'])){
                $errors[] = 'le code postal est invalide';
            }
            if(!empty($post['cityModif']) && !v::length(2,null)->validate($post['cityModif'])){
                $errors[] = 'la ville est invalide';
            }
            if(!empty($post['phoneModif']) && !v::phone()->validate($post['phoneModif'])){
                $errors[] = 'Le téléphone est invalide';
            }
            if(!empty($post['emailModif']) && !v::email()->validate($post['emailModif'])){
                $errors[] = 'Votre email est invalide';
            }
            if(!empty($post['webModif']) && !v::length(0,null)->validate($post['webModif'])){
                $errors[] = 'Votre site web n\'est invalide';
            }
            if(!empty($post['githubModif']) && !v::length(0,null)->validate($post['githubModif'])){
                $errors[] = 'Votre github n\'est invalide';
            }
            if(!empty($post['passwordModif']) && !v::length(0,null)->validate($post['passwordModif'])){
                $errors[] = 'Votre mot de passe est erroné!';
            }
            if($post['passwordModif'] !== $post['passwordConfirmModif']){
                $errors[] = 'les mots de passe ne sont pas identiques';
            }
            if(count($errors) === 0){
                $validFicheEnt = true ;

                $entityManager = $this->getDoctrine()->getManager();

                $ficheEntUpdate->setFirstname($post['firstnameModif']);
                $ficheEntUpdate->setLastname($post['lastnameModif']);
                $ficheEntUpdate->setAddress($post['addressModif']);
                $ficheEntUpdate->setZipcode($post['zipcodeModif']);
                $ficheEntUpdate->setCity($post['cityModif']);
                $ficheEntUpdate->setPhone($post['phoneModif']);
                $ficheEntUpdate->setWeb($post['webModif']);
                $ficheEntUpdate->setGithub($post['githubModif']);
                $ficheEntUpdate->setEmail($post['emailModif']);
                $ficheEntUpdate->setPassword($this->passwordEncoder->encodePassword($ficheEntUpdate, $post['passwordModif']));


                //$entityManager->persist($ficheEntUpdate);
                $entityManager->flush();

                $this->addFlash(
                    'modifEnt',
                    'Votre fiche a bien été modifiée!'
                );
                return $this->redirectToRoute('ficheEnt');
            } else {
                $validFicheEnt = false;
            }
        }
        return $this->render('entreprise/modifEnt.html.twig', [
            'validFicheEnt' => $validFicheEnt ?? null,
            'errors' => $errors ?? [],
            'ficheEntUpdate' => $ficheEntUpdate,
        ]);
    }


    /**
     * @Route("/entreprise/add", name="addStudent_entreprise")
     */
     public function addStudent()
    {
        $post = [];
        $errors = [];

        $entityManager = $this->getDoctrine()->getManager();
        $sectionStudent = $entityManager->getRepository(Section::class)->findAll();
        $schoolStudent = $entityManager->getRepository(School::class)->findAll();
        $frameworkStudent = $entityManager->getRepository(Framework::class)->findAll();
        $langageStudent = $entityManager->getRepository(Langages::class)->findAll();


        if(!empty($_POST)){
            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(!v::notEmpty()->length(2,null)->validate($post['firstname'])){
                $errors[] = 'Le prénom étudiant est invalide';
            }

            if(!v::notEmpty()->length(2,null)->validate($post['lastname'])){
                $errors[] = 'Le nom étudiant est invalide';
            }

            if(!v::notEmpty()->length(2,null)->validate($post['address'])){
                $errors[] = 'Adresse invalide';
            }

            if(!v::notEmpty()->length(2,null)->validate($post['zipcode'])){
                $errors[] = 'le code postal est invalide';
            }

            if(!v::notEmpty()->length(2,null)->validate($post['city'])){
                $errors[] = 'la ville est invalide';
            }

            if(!v::notEmpty()->phone()->validate($post['phone'])){
                $errors[] = 'Le téléphone est invalide';
            }


            if(!v::notEmpty()->date()->validate($post['birthdate'])){
                $errors[] = 'La date de naissance est invalide';
            }

            if(!v::notEmpty()->email()->validate($post['email_pro'])){
                $errors[] = 'Votre email est invalide';
            }

            if(!v::notEmpty()->length(2, null)->validate($post['password'])){
                $errors[] = 'Votre mot de passe est erroné!';
            }

            if($post['password'] !== $post['passwordConfirm']){
                $errors[] = 'les mots de passe ne sont pas identiques';
            }
            /*
            if(!ck::notEmpty()->validate($_POST['langage'])){
                $errors[] = '';
            }
            */

            if(count($errors) === 0){
                $formValid = true ;

                $stud = new Users();

                $stud->setFirstname($post['firstname']);
                $stud->setLastname($post['lastname']);
                $stud->setAddress($post['address']);
                $stud->setZipcode($post['zipcode']);
                $stud->setCity($post['city']);
                $stud->setPhone($post['phone']);
                $stud->setMark($post['mark']);
                $stud->setBirthdate(new \dateTime($post['birthdate']));
                $stud->setFormation($post['section']);
                $stud->setSchool($post['school']);

                $stud->setEmail($post['email']);

                $stud->setPassword($this->passwordEncoder->encodePassword($stud, $post['password']));
                $stud->setDateRegistration(new \dateTime('now'));
                $stud->setRoles(['ROLE_STUDENT']);

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($stud);
                $entityManager->flush();

            } else {
                $formValid = false;
            }
        }

        return $this->render('entreprise/addstudent.html.twig', [
            'formValid'    => $formValid ?? null,
            'errors'    => $errors ?? [] ,
            'sectionStudent' => $sectionStudent,
            'schoolStudent' => $schoolStudent,
            'frameworkStudent' => $frameworkStudent,
            'langageStudent' => $langageStudent,

        ]);
    }



    /**
     * Permet un étudiant de contacter une entreprise via Ajax
     * @Route("/ajax/allow-student-contact", name="allow_student_contact")
     */
    public function ajaxAllowStudent()
    {
        //$entityManager = $this->getDoctrine()->getManager();
        //$studentIdEmail = $entityManager->getManager(USers::class)->find($id);

        if(!empty($_POST)){
            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(!empty($post['id_entreprise']) && is_numeric($post['id_entreprise'])
                && !empty($post['id_student']) && is_numeric($post['id_student']) && isset($post['new_status']))
            {


                $entityManager = $this->getDoctrine()->getManager();
                $entStudAccept = $entityManager->getRepository(EntStudAccept::class)->findOneBy([
                    'ent_id' => (int) $post['id_entreprise'],
                    'stud_id' => (int) $post['id_student'],
                ]);


                if(!empty($entStudAccept)){
                    // Mise à jour

                    $entStudAccept->setEntId($post['id_entreprise']);
                    $entStudAccept->setStudId($post['id_student']);
                    $entStudAccept->setAccept($post['new_status']);

                    $entityManager->flush();
                }
                else {
                    // Insert
                    $entStudAccept = new EntStudAccept();
                    $entStudAccept->setEntId($post['id_entreprise']);
                    $entStudAccept->setStudId($post['id_student']);
                    $entStudAccept->setAccept($post['new_status']);

                    $entityManager->persist($entStudAccept);
                    $entityManager->flush();
                }

                    /*
                    $message = '<p>Bonjour '.$post['firstname'].' '.$post['lastname'].',';
                    $message.= '<br> Bienvenue sur la plateforme RGB :';
                    $message.= '<br> Merci pour votre inscription, veuillez retrouver vos identifiants ci-dessous :';
                    $message.= '<br> login : '.$post['email'];
                    $message.= '<br> mot de passe : '.$post['password'];
                    $message.= '<br>A très bientôt sur RGB.';
                    $message.= '</p>';

                    $email = (new Email())
                        ->from('hello@rgb.fr')
                        ->to('you@example.fr')
                        ->subject('Inscription au site RGB en date du '.date('d/m/Y'))
                        ->text(strip_tags($message))
                        ->html($message);

                    $sentEmail = $mailer->send($email);
                    */

                return $this->json([
                    'status' => 'ok',
                    'entStudAccept' => $entStudAccept,

                ]);
            }
        }

    }

}
