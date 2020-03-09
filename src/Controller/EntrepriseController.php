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
        return $this->render('entreprise/index.html.twig', [

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


        return $this->render('entreprise/ficheEtu.html.twig', [
            'studentList' => $studentList,
            'sectionList' => $sectionList,
        ]);
    }


    /**
     * @Route("/entreprise/ficheEtudiant/view/{id}", name="viewStu")
     */
    public function viewStudent(int $id)
    {

        $entityManager = $this->getDoctrine()->getManager();
        $viewStudent = $entityManager->getRepository(Users::class)->find($id);

        /*
        if ($_POST['switchAccept'] == 1 ) {
            $EntStudAccept = new EntStudAccept();

            $EntStudAccept->setRoles(['ROLE_STUDENT']);

            dump($EntStudAccept->setentId('app.user'));
            dump($EntStudAccept->setstudId('$viewStudent.id'));
            dump($EntStudAccept->setAccept($_POST['switchAccept']));
            die;

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($EntStudAccept);
            $entityManager->flush();
        }*/


        return $this->render('entreprise/view.html.twig', [
            'view_student'  => $viewStudent,
        ]);
    }


    /**
     * @Route("/entreprise/ficheEcole", name="ficheSchool")
     */
    public function ficheSchool()
    {

        return $this->render('entreprise/ficheEco.html.twig', [

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
     * @Route("/entreprise/ficheEntreprise/modif", name="modifficheEnt")
     */
    public function modifFicheEnt()
    {
        $post = [];
        $errors = [];

        $entityManager = $this->getDoctrine()->getManager();
        if (!empty($_POST)) {
            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(!v::length(2,null)->validate($post['firstnameModif'])){
                $errors[] = 'Le prénom est invalide';
            }
            if(!v::length(2,null)->validate($post['lastnameModif'])){
                $errors[] = 'Le nom est invalide';
            }
            if(!v::length(2,null)->validate($post['addressModif'])){
                $errors[] = 'Adresse invalide';
            }
            if(!v::length(2,null)->validate($post['zipcodeModif'])){
                $errors[] = 'le code postal est invalide';
            }
            if(!v::length(2,null)->validate($post['cityModif'])){
                $errors[] = 'la ville est invalide';
            }
            if(!v::phone()->validate($post['phoneModif'])){
                $errors[] = 'Le téléphone est invalide';
            }
            if(!v::email()->validate($post['emailModif'])){
                $errors[] = 'Votre email est invalide';
            }
            if(!v::length(0,null)->validate($post['webModif'])){
                $errors[] = 'Votre site web n\'est invalide';
            }
            if(!v::length(0,null)->validate($post['githubModif'])){
                $errors[] = 'Votre github n\'est invalide';
            }
            if(!v::length(0,null)->validate($post['passwordModif'])){
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
                $ficheEntUpdate->setEmail($post['emailModif']);
                $ficheEntUpdate->setPassword($this->passwordEncoder->encodePassword($ficheEntUpdate, $post['passwordModif']));


                $entityManager->persist($ficheEntUpdate);
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


}
