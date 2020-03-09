<?php

namespace App\Repository;

use App\Entity\Users;
use App\Entity\Langages;
use App\Entity\Framework;
use App\Entity\Section;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\User\PasswordUpgraderInterface;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @method Users|null find($id, $lockMode = null, $lockVersion = null)
 * @method Users|null findOneBy(array $criteria, array $orderBy = null)
 * @method Users[]    findAll()
 * @method Users[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UsersRepository extends ServiceEntityRepository implements PasswordUpgraderInterface
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Users::class);
    }


    public function upgradePassword(UserInterface $user, string $newEncodedPassword): void
    {
        if(!$user instanceof User){
            throw new UnsupportedUserException(sprintf('Instances of "%" ar not supported.', \get_class($user)));
        }

        $user->setPassword($newEncodedPassword);
        $this->_em->persist($user);
        $this->_em->flush();

    }

    // /**
    //  * @return Users[] Returns an array of Users objects
    //  */

    public function search(
        $search_users = null,
        $search_section = null,
        $search_langages = null,
        $search_framework = null
    ) {
        $query = $this->createQueryBuilder('u');

        if (!empty($search_users)) {
            $query->orWhere('u.lastname = :valeur');
            $query->orWhere('u.firstname = :valeur');
            $query->andWhere('u.ROLE_USER');
            $query->setParameter('valeur', '%'.$search_users.'%');
        }

        if (!empty($search_section)) {
            $query->andWhere('u.name = :valeur');
            $query->setParameter('valeur', '%'.$search_section.'%');
        }

        if (!empty($search_langages)) {
            $query->andWhere('u.langage = :valeur');
            $query->setParameter('valeur', '%'.$search_langages.'%');
        }

        if (!empty($search_framework)) {
            $query->andWhere('u.name = :valeur');
            $query->setParameter('valeur', '%'.$search_framework.'%');
        }

        $query->getQuery()->getResult();

        return $query;

    }


    /*
    # Fonction non utilisée
    public function list($id){
        return $this->createQueryBuilder('section')
            ->andWhere('section.id = :users.section_id')
            ->setParameter('users.section_id', $id)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */


    # Function filtre liste étudiant (table)
    public function findAllByRole($role_search)
    {

        if(is_array($role_search)){
            die('Erreur.. string attendue');
        }

        return $this->createQueryBuilder('u')
            ->andWhere('u.roles LIKE :val')
            ->setParameter('val', '%'.$role_search.'%')
            ->getQuery()
            ->getResult();
    }

    /*
    public function jointSection()
    {
        $qb = $this->createQueryBuilder('u')
                   ->leftJoin('u.sectionID', 's.id')*
                   ->addSelect('s.id');

        return $qb->getQuery();
                  ->getResult();
    }
    */
    /*
    public function leftJoin($value)
    {
         $qb = $this->createQueryBuilder('c')
         $qb->innerJoin('c.sectionId', 'sectId')
            ->addSelect('sectId')
            ->where($qb->exp()->eq('sectionID.section', $qb->expr()->literal(1)))
            -andWhere($qb->expr()-eq('c.'))
            ->setParameter('sectionId', $value)
            ->getQuery()
            ->getOneOrNullResult();
    }*/

}
