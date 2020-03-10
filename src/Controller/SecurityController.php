<?php

namespace App\Controller;

use App\Entity\Users;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    /**
     * @Route("/login", name="app_login")
     */
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // if ($this->getUser()) {
        //     return $this->redirectToRoute('target_path');
        // }
        $entityManager = $this->getDoctrine()->getManager();
        $user = $this->getUser();


        if($user){
            if(in_array('ROLE_ENTREPRISE', $user->getRoles())){
                return $this->redirectToRoute('indexEnt');
                //si le ROLE_ENTREPRISE doit être rediriger vers une page attente....
                /*if($user->getConnect() == 'true'){
                    return $this->redirectToRoute('indexEnt');
                }
                else {
                    return $this->redirectToRoute('attentePage');
                }*/
            }

            if(in_array('ROLE_SCHOOL', $user->getRoles())){
                return $this->redirectToRoute('index_school');
          }
          if(in_array('ROLE_STUDENT', $this->getUser()->getRoles())){
                return $this->redirectToRoute('student_home');
          }
          if(in_array('ROLE_ADMIN', $this->getUser()->getRoles())){
                return $this->redirectToRoute('index_admin');
            }
        }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', [
            'last_username' => $lastUsername,
            'error'         => $error
        ]);
    }

    /**
     * @Route("/logout", name="app_logout")
     */
    public function logout()
    {
        throw new \Exception('This method can be blank - it will be intercepted by the logout key on your firewall');
    }


}
