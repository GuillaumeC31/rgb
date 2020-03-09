<?php

namespace App\DataFixtures;

use App\Entity\Users;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class UserFixture extends Fixture
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
      $this->passwordEncoder = $passwordEncoder;
    }

    public function load(ObjectManager $manager)
    {
        $users = new Users();
        $users->setIdentity('WEBFORCE3');
        $users->setEmail('admin@wf3.fr');
        $users->setPassword($this->passwordEncoder->encodePassword(
          $users,
          '123456789'
        ));
        $users->setZipcode('31400');
        $users->setCity('TOULOUSE');
        $manager->persist($users);
        $manager->flush();
    }
}
