<?php

namespace App\Controller;

use App\Entity\Users;
use App\Entity\Ape;
use App\Entity\Apeschool;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Respect\Validation\Validator as v;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Doctrine\ORM\EntityManager ;




class SchoolController extends AbstractController
{
    const ALLOW_CHARS = 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØŒŠþÙÚÛÜÝŸàáâãäåæçèéêëìíîïðñòóôõöøœšÞùúûüýÿß%- ';

    /**
     * @Route("/school", name="index_school")
     *
     * @IsGranted("ROLE_SCHOOL")
     */
    public function index()
    {
        $post = [];
        $errorForm = [];

        $entityManager = $this->getDoctrine()->getManager();
        $listApe = $entityManager->getRepository(Ape::class)->findAll();
        $listApeSchool = $entityManager->getRepository(Apeschool::class)->findAll();

        if (!empty($POST)) {
            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(!v::notEmpty()->length(2,7)->validate($post['ape_code'])){
                $errorForm[] = 'Le code APE est invalide';
            }

            if(!v::notEmpty()->length(2,null)->validate($post['ape_name'])){
                $errorForm[] = 'La désignation APE est invalide';
            }

            if(count($errorForm) == 0){
                $validationForm = true;

                $ape = new Apeschool();

                $ape->setCode($post['ape_code']);
                $ape->setNameape($post['ape_name']);
                $ape->setSchoolId('app.user');

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($ape);
                $entityManager->flush();

            } else {
                $validationForm = false;
            }
        }

        return $this->render('school/index.html.twig', [
            'listApe'           => $listApe,
            'listApeSchool'     => $listApeSchool,
            'validationForm'    => $validationForm ?? null,
            'errorForm'         => $errorForm,
        ]);
    }

    /**
     * @Route("/school/liste", name="listEnt")
     */
    public function listEnt()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $EntList = $entityManager->getRepository(Users::class)->findAllByRole('ROLE_ENTREPRISE');
        $apeSchoolValid = $entityManager->getRepository(Apeschool::class)->findAll();

        return $this->render('school/listEnt.html.twig', [
            'entList'     =>  $EntList,
            'apeSchoolValid' => $apeSchoolValid,

        ]);
    }

    /**
     * @Route("/school/liste", name="list_school")
     */
    public function listStudent()
    {
        $entityManager = $this->getDoctrine()->getManager();

        $listStudent = $entityManager->getRepository(Users::class)->findAllByRole('ROLE_STUDENT');
        $EntList = $entityManager->getRepository(Users::class)->findAllByRole('ROLE_ENTREPRISE');



        return $this->render('school/list_school.html.twig', [
            'listStudent' =>  $listStudent,
            'entList'     =>  $EntList,

        ]);
    }

     /**
     * @Route("/school/modif_student/{id}", name="modif_student")
     */

    public function modif( int $id)
    {
        $post = [];
        $errors = [];

         $entityManager = $this->getDoctrine()->getManager();
         $sectionStudent = $entityManager->getRepository(Users::class)->find($id);


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



                $users->setFirstname($post['firstname']);
                $users->setLastname($post['lastname']);
                $users->setAddress($post['address']);
                $users->setZipcode($post['zipcode']);
                $users->setCity($post['city']);
                $users->setPhone($post['phone']);
                $users->setEmail($post['email']);
                $users->setMark($post['mark']);
                $users->setBirthdate(new \dateTime($post['birthdate']));
                $users->setSchool($post['school']);
                $users->setDateRegistration(new \dateTime('now'));
                $users->setRoles(['ROLE_STUDENT']);

                $entityManager->persist($users);
                $entityManager->flush();

             }
            else {
                $formValid = false;
            }
    }
        return $this->render('school/modif_student.html.twig', [
            'user' => $users,
        ]);
    }
     /**
     * @Route("/school/add_user", name="add_user")
     */
    public function addEnt()
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
                    if(!v::notEmpty()->alnum()->length(14,14)->validate($post['num_siret'])){
                        $errors[] = 'Votre numéro de SIRET est invalide';
                    }



            if(count($errors) === 0){

                $formValid = true ;

                $ent = new Users();
                $ent->setIdentity($post['name_ent']);
                $ent->setSiret($post['num_siret']);
                $ent->setAdressPro($post['address_pro']);
                $ent->setZipcodePro($post['zipcode_pro']);
                $ent->setDateRegistration(new \dateTime('now'));
                $ent->setRoles(['ROLE_ENTREPRISE']);


                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($ent);
                $entityManager->flush();

          }
            else {
                $formValid = false;
            }
        }
         return $this->render('school/add_user.html.twig', [
            'status_form'     =>  $formValid ?? null,
            'errors_form'     =>  $errors ,
        ]);
    }

    /**
     * @Route("/school/view_student/{id}", name="view_student")
     *
     */
    public function viewStudent(int $id)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $users = $entityManager->getRepository(Users::class)->find($id);

        return $this->render('school/view_student.html.twig',  [
            'users'    => $users,

        ]);

    }

    /**
     * @Route("/school/view_ent/{id}", name="view_ent")
     *
     */
    public function viewEntreprise(int $id)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $users = $entityManager->getRepository(Users::class)->find($id);

        return $this->render('school/view_ent.html.twig',  [
            'users'    => $users,

        ]);

    }

}
