<?php

namespace App\Controller;

use App\Entity\Users;
use App\Entity\Apeschool;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Respect\Validation\Validator as v;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;


class HomeController extends AbstractController
{

    const ALLOW_CHARS = 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØŒŠþÙÚÛÜÝŸàáâãäåæçèéêëìíîïðñòóôõöøœšÞùúûüýÿß%- ';

    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
      $this->passwordEncoder = $passwordEncoder;
    }


    /**
     * @Route("/", name="home_index")
     */
    public function index()
    {
        return $this->render('home/index.html.twig');
    }

     /**
     * @Route("/home/registration", name="home_registration")
     */

     public function register(MailerInterface $mailer)
    {
        $post = [];
        $errors = [];
        $info =[];

        $entityManager = $this->getDoctrine()->getManager();
        $apeSchool = $entityManager->getRepository(Apeschool::class)->findAll();

        if(!empty($_POST)){
            $post = array_map('trim', array_map('strip_tags', $_POST));

            #dump($post);
            #die;

            /* RENSEIGNEMENTS ENTREPRISE */

            if(!v::notEmpty()->length(2,null)->validate($post['identity'])){
                $errors[] = 'Le nom  d\'entreprise est invalide';
            }
            if(!v::notEmpty()->numeric()->length(9,14)->validate($post['siret'])){
                $errors[] = 'Votre numéro de SIRET est invalide';
            }
            if(!v::notEmpty()->email()->validate($post['emailPro'])){
                $errors[] = 'Votre email est invalide';
            }
            if(!v::notEmpty()->phone()->validate($post['phonePro'])){
                $errors[] = 'Votre numéro de téléphone est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['webPro'])){
                $errors[] = 'Le site web est invalide';
            }

            /* RENSEIGNEMENTS CONTACT */

            if(!v::notEmpty()->length(2,null)->validate($post['firstname'])){
                $errors[] = 'Le prénom est invalide';
            }
            if(!v::notEmpty()->length(2,null)->validate($post['lastname'])){
                $errors[] = 'Le nom est invalide';
            }
            if(!v::notEmpty()->phone()->validate($post['phone'])){
                $errors[] = 'Votre numéro de téléphone est invalide';
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

            /*
            if(isset($apeSchool) !== $post['sirene_code_ape'] ){
                $info = 'votre code ape ne correspond pas à une connexion automatique, une demande de validation manuel viens d\'être envoyée à l\'administrateur du centre de formation!';
            } else {
                $info = 'votre demande a bien été prise en compte, vous allez recevoir un email de confirmation.'
            }
            */

            /*
            if(in_array(.. , [... ])){
                // Validation auto
            }
            */

            if(count($errors) === 0){
                $formValid = true ;

                $ent = new Users();

                # entreprise :
                $ent->setIdentity($post['identity']);
                    #$ent->setSiret($post['siret']);
                $ent->setPhonePro($post['phonePro']);
                $ent->setEmailPro($post['emailPro']);
                $ent->setWebPro($post['webPro']);

                # info de l'API :
                $ent->setApeCode($post['sirene_code_ape']);
                $ent->setApeName($post['denomination']);
                $ent->setSiret($post['siret']);
                $ent->setSiren($post['siren']);
                $ent->setNic($post['nic']);
                $ent->setAdressPro($post['adresse']);
                $ent->setZipcodePro($post['codepostal']);
                    #$ent->setIdentity($post['denomination']);
                $ent->setCityPro($post['commune']);
                $ent->setDepartement($post['departement']);
                $ent->setRegion($post['codedepartement']);
                $ent->setRegion($post['region']);
                $ent->setRegion($post['activite']);
                $ent->setApeName($post['groupeent']);

                # contact :
                $ent->setFirstname($post['firstname']);
                $ent->setLastname($post['lastname']);
                $ent->setPhone($post['phone']);
                $ent->setemail($post['email']);
                $ent->setPassword($this->passwordEncoder->encodePassword($ent, $post['password']));
                #divers
                $ent->setDateRegistration(new \dateTime('now'));
                $ent->setRoles(['ROLE_ENTREPRISE']);

                #divers :
                $ent->setUserId('0');
                $ent->setPhotoProfileId('0');

                /*
                if(count($info) === 0){
                    $infoValid = true;
                    $ent->setConnect('auto');
                } else {
                    $infoValid = false;
                    $ent->setConnect('manuel');
                }
                */

                /* RECUPERATION DES INFORMATION API dans home/index.html.twig

<input type="hidden" name="sirene_code_ape" id="sirene_code_ape" value="sirene_code_ape">
<input type="hidden" name="denomination" id="denomination" value="denomination">
<input type="hidden" name="denomination2" id="denomination2" value="denomination2">
<input type="hidden" name="siret" id="siret" value="siret">
<input type="hidden" name="siren" id="siren" value="siren">
<input type="hidden" name="nic" id="nic" value="nic">
<input type="hidden" name="adresse" id="adresse" value="adresse">
<input type="hidden" name="codepostal" id="codepostal" value="codepostal">
<input type="hidden" name="codepostal2" id="codepostal2" value="codepostal2">
<input type="hidden" name="commune" id="commune" value="commune">
<input type="hidden" name="departement" id="departement" value="departement">
<input type="hidden" name="codedepartement" id="codedepartement" value="codedepartement">
<input type="hidden" name="region" id="region" value="region">
<input type="hidden" name="activite" id="activite" value="activite">
<input type="hiden" name="groupeent" id="groupeent" value="groupeent">



                */


                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($ent);
                $entityManager->flush();

                $email = '<p>Bonjour , ';
                $email.= '<br> Bienvenue sur RGB :';

                $email = new Email();
                $email->from('Papercut@papercut.com');
                $email->to('alexanderfry@live.fr');
                $email->replyTo($post['email']);
                $email->subject('[Contact du site ] Nouveau message du site le '.date('d/m/Y H:i'));
                $email->text('RGB vous souhaite la bienvenue');
                $email->html('<p></p>');

                $sentEmail = $mailer->send($email);

                $this->addFlash(
                    'register',
                    'Votre demande d\enregistrement à bien été prise en compte<br>
                    Un mail vous a été envoyer avec vos identifiant!<br>
                    Bonne recherche.'
                );
                return $this->redirectToRoute('app_login');
             }
            else {
                $formValid = false;
            }
    }

        return $this->render('home/registration.html.twig', [
            'status_form'    => $formValid ?? null,
            'errors_form'    => $errors ?? [] ,


        ]);
    }
}
