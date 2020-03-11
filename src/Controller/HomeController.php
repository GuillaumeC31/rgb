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
     * @Route("/attenteValidation", name="attentePage")
     */
    public function attente()
    {

        $entityManager = $this->getDoctrine()->getManager();


        return $this->render('home/attente.html.twig');
    }

     /**
     * @Route("/home/registration", name="home_registration")
     */

     public function register(MailerInterface $mailer)
    {
        $post = [];
        $errors = [];
        $comparaison = [];

        $entityManager = $this->getDoctrine()->getManager();

        /* JE RENSEIGNE LES DONNEES */

        if(!empty($_POST)){
            $post = array_map('trim', array_map('strip_tags', $_POST));

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
            if(!empty($post['webPro']) && !v::notEmpty()->length(2,null)->validate($post['webPro'])){
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
                $errors[] = 'Votre mot de passe n\'est pas valide!';
            }
            if($post['password'] !== $post['passwordConfirm']){
                $errors[] = 'les mots de passe ne sont pas identiques';
            }

            /* JE COMPARE LES CODE APE API ET BDD */

            $validationAutoAPE = false;

            if(isset($post['sirene_code_ape']) && !empty($post['sirene_code_ape'])){

                $apeSchool = $entityManager->getRepository(Apeschool::class)->findOneBy([
                    'code' => $post['sirene_code_ape'],
                ]);

                if(empty($apeSchool)){
                    $infoFalse = 'votre code ape ne correspond pas à une connexion automatique, une demande de validation manuel viens d\'être envoyée à l\'administrateur du centre de formation!';
                }
                else {
                    $validationAutoAPE = true;
                    $infoTrue = 'votre demande a bien été prise en compte, vous allez recevoir un email de confirmation.';
                }
            }
            //dump($apeSchool);
            //dump($post['sirene_code_ape']);
            //die;

            /* SI IL EXISTE PAS D'ERREUR -> ENREGISTREMENT DE L'ENTREPRISE */

            if(count($errors) === 0){
                $formValid = true ;

                $ent = new Users();

                # entreprise :
                $ent->setIdentity($post['identity']);
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
                $ent->setCityPro($post['commune']);
                $ent->setDepartement($post['departement']);
                $ent->setCodeDepartement($post['codedepartement']);
                $ent->setRegion($post['region']);
                $ent->setActivite($post['activite']);
                $ent->setApeName($post['groupeent']);

                # contact :
                $ent->setFirstname($post['firstname']);
                $ent->setLastname($post['lastname']);
                $ent->setPhone($post['phone']);
                $ent->setEmail($post['email']);
                $ent->setPassword($this->passwordEncoder->encodePassword($ent, $post['password']));

                #divers
                $ent->setDateRegistration(new \dateTime('now'));
                $ent->setRoles(['ROLE_ENTREPRISE']);

                #divers :
                $ent->setUserId('0');
                $ent->setPhotoProfileId('0');


                //$ent->setConnect(($validationAutoAPE) ? 'true' : 'false'); // Version Axel

                if ($validationAutoAPE == false) {
                    $ent->setConnect('false'); // envoie un false à la BDD - Connexion NON VALIDEE
                } else {
                    $ent->setConnect('true'); // envoie un true à la BDD - Connexion AUTO / VALIDEE
                }

                $entityManager->persist($ent);
                $entityManager->flush();

                /* VERIFICATION ENREGISTREMENT AUTOMATIQUE OU MANUEL D'UNE ENTREPRISE si pas d'erreur */

                if ($validationAutoAPE == false) { // Si validation non validée

                    $comparaison = false;

                    # Connexion Auto :
                    //$ent->setConnect('false'); // envoie un false à la BDD

                    $mesConnect = '<p>Bonjour '.$post['firstname'].' '.$post['lastname'].',';
                    $mesConnect.= '<br> Une inscription à la plateforme RGB réclame votre attention.';
                    $mesConnect.= '<br> l\'entreprise '.$post['identity'].' souhaite s\'inscrire mais son APE ne correspond pas à vos critères';
                    $mesConnect.= '<br> voici les informations de cette entité : ';
                    $mesConnect.= '<br> Nom : '.$post['firstname'].' '.$post['lastname'];
                    $mesConnect.= '<br> email contact : '.$post['email'];
                    $mesConnect.= '<br> email société : '.$post['emailPro'];
                    $mesConnect.= '<br> téléphone contact : '.$post['phone'];
                    $mesConnect.= '<br> téléphone société : '.$post['phonePro'];
                    $mesConnect.= '<br> ';
                    $mesConnect.= '<br> Veuillez porter attention à cette entreprise et valider son accès si possible.';
                    $mesConnect.= '<br>A très bientôt sur RGB.';
                    $mesConnect.= '</p>';

                    $mailConnect = (new Email()) // envoie un mail au CENTRE DE FORMATION
                                    ->from($post['email']) //
                                    ->to('you@example.fr') // envoie un message à Centre de Formation
                                    ->subject('Inscription au site RGB en date du '.date('d/m/Y'))
                                    ->text(strip_tags($mesConnect))
                                    ->html($mesConnect);

                    $sentEmail = $mailer->send($mailConnect);

                    // ENVOPIE UN MAIL A ENTREPRISE
                    // lui indiquer qu'il est en attente manuel de connexion
                    // le rediriger vers une page d'attente. (=> Connect = False)

                    return $this->redirectToRoute('attentePage');

                } else { // Envoie d'un TRUE a la BDD - Connexion AUTOMATIQUE

                    $comparaison = true;

                    # Connexion Auto :

                    $this->addFlash(
                        'register',
                        'Votre demande d\'enregistrement a bien été prise en compte<br>Un mail vous a été envoyé avec vos identifiants!<br>Bonne recherche.'
                    );

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

                    return $this->redirectToRoute('app_login'); // Redirection page login
                }

            } else {
                $formValid = false;
            }
        }

        return $this->render('home/registration.html.twig', [
            'status_form'    => $formValid ?? null,
            'errors_form'    => $errors ?? [] ,
            'comparaison'    => $comparaison ?? null,
        ]);

    }



}
