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
        $post = [];
        $errors = [];

        if (!empty($_POST)) {

            $post = array_map('trim', array_map('strip_tags', $_POST));

            if(!v::notEmpty()->length(2,null)->validate($post['identity'])){
                $errors[] = 'Le nom du centre de formation est invalide';
            }
            if(!v::notEmpty()->phone()->validate($post['phonePro'])){
                $errors[] = 'Le téléphone est invalide';
            }
            if(!v::notEmpty()->email()->validate($post['emailPro'])){
                $errors[] = 'votre email est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['webPro'])){
                $errors[] = 'votre site web est invalide';
            }


            if(!v::notEmpty()->numeric()->length(9,14)->validate($post['num_siret'])){
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

                # Centre de formation
                $school->setIdentity($post['identity']);
                $school->setPhonePro($post['phonePro']);
                $school->setEmailPro($post['emailPro']);
                $school->setWebPro($post['webPro']);

                #Info de l'API
                $school->setApeCode($post['sirene_code_ape']);
                $school->setApeName($post['denomination']);
                $school->setSiret($post['siret']);
                $school->setSiren($post['siren']);
                $school->setNic($post['nic']);
                $school->setAdressPro($post['adresse']);
                $school->setZipcodePro($post['codepostal']);
                    #$ent->setIdentity($post['denomination']);
                $school->setCityPro($post['commune']);
                $school->setDepartement($post['departement']);
                $school->setCodeDepartement($post['codedepartement']);
                $school->setRegion($post['region']);
                $school->setActivite($post['activite']);
                $school->setApeName($post['groupeent']);

                # Responsable de l'école
                $school->setFirstname($post['firstname']);
                $school->setLastname($post['lastname']);
                $school->setEmail($post['email']);

                $school->setPassword($this->passwordEncoder->encodePassword($school, $post['password']));
                //$stud->setPassword($post['password']);
                $school->setDateRegistration(new \dateTime('now'));
                $school->setRoles(['ROLE_SCHOOL']);

                # Divers
                $school->setUserId('0');
                $school->setPhotoProfileId('0');

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($school);
                $entityManager->flush();

                $message = '<p>Bonjour '.$post['firstname'].' '.$post['lastname'].',';
                $message.= '<br> Bienvenue sur la plateforme RGB :';
                $message.= '<br> Merci pour votre inscription, veuillez retrouver vos identifiants ci-dessous :';
                $message.= '<br> login : '.$post['email'];
                $message.= '<br> mot de passe : '.$post['password'];
                $message.= '<br>A très bientôt sur RGB.';
                $message.= '</p>';

                /*
                $email = (new Email())
                    ->from('hello@rgb.fr')
                    ->to('you@example.fr')
                    ->subject('Inscription au site RGB en date du '.date('d/m/Y'))
                    ->text(strip_tags($message))
                    ->html($message);

                $sentEmail = $mailer->send($email);
                */
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
