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
use App\Entity\City;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class AdminController extends AbstractController
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
      $this->passwordEncoder = $passwordEncoder;
    }

    /**
     * @Route("/admin", name="index_admin")
     */
    public function index()
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        $users = $this->getUser();

        $entityManager = $this->getDoctrine()->getManager();
        $schoolList = $entityManager->getRepository(Users::class)->findAllByRole('ROLE_SCHOOL');

        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
            'school_List' => $schoolList,
        ]);
    }

    /**
     * @Route("/admin/addSchool", name="addSchool_admin")
     */
    public function addSchool()
    {
        $entityManager = $this->getDoctrine()->getManager();
        #$viewCity = $entityManager->getRepository(City::class)->findAll();
        $errors = [];

        if (!empty($_POST)) {

            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(!v::notEmpty()->length(2,null)->validate($post['identity'])){
                $errors[] = 'Le nom du centre de formation est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['adress_pro'])){
                $errors[] = 'L\'adresse est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['zipcode_pro'])){
                $errors[] = 'le code postal est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['city_pro'])){
                $errors[] = 'la ville est invalide';
            }
            if(!v::notEmpty()->phone()->validate($post['phone_pro'])){
                $errors[] = 'Le téléphone est invalide';
            }
            if(!v::notEmpty()->email()->validate($post['email_pro'])){
                $errors[] = 'votre email est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['web_pro'])){
                $errors[] = 'votre site web est invalide';
            }
            if(v::length(14,14)->validate($post['siret'])){
                $errors[] = 'votre numéro de siret web est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['firstname'])){
                $errors[] = 'votre prénom est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['lastname'])){
                $errors[] = 'votre nom de famille est invalide';
            }
            if(!v::notEmpty()->email()->validate($post['email'])){
                $errors[] = 'votre email est invalide';
            }
            if(!v::notEmpty()->length(2, null)->validate($post['password'])){
                $errors[] = 'Votre mot de passe est erroné!';
            }
            if($post['password'] !== $post['passwordConfirm']){
                $errors[] = 'les mots de passe ne sont pas identiques';
            }


            if(count($errors) == 0){
                $formValid = true ;

                $school = new Users();

                $school->setFirstname($post['firstname']);
                $school->setLastname($post['lastname']);
                $school->setAdressPro($post['adress_pro']);
                $school->setZipcodePro($post['zipcode_pro']);
                $school->setCityPro($post['city_pro']);
                $school->setPhonePro($post['phone_pro']);
                $school->setEmailPro($post['email_pro']);
                $school->setEmail($post['email']);
                $school->setWebPro($post['web_pro']);
                $school->setSiret($post['siret']);
                $school->setIdentity($post['identity']);


                $school->setPassword($this->passwordEncoder->encodePassword($school, $post['password']));
                //$stud->setPassword($post['password']);
                $school->setDateRegistration(new \dateTime('now'));
                $school->setRoles(['ROLE_SCHOOL']);

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($school);
                $entityManager->flush();

                $this->addFlash(
                    'addSchool', 'le centre de formation '.$post['identity'].' a bien été crée!'
                );
                return $this->redirectToRoute("index_admin");

                }
                else {
                    $formValid = false ;
                }

        }

        return $this->render('admin/addSchool.html.twig', [
            'formValid' => $formValid ?? null,
            'errors'    => $errors ?? [] ,
        ]);
    }

    /**
     * @Route("/admin/school/view/{id}", name="view_admin")
     */
    public function viewSchool(int $id)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $viewSchool = $entityManager->getRepository(Users::class)->find($id);

        $errors = [];
        return $this->render('admin/viewschool.html.twig', [
            'view_school'  => $viewSchool,
        ]);
    }
}
