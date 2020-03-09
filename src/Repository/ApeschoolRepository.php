<?php

namespace App\Repository;

use App\Entity\Apeschool;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Apeschool|null find($id, $lockMode = null, $lockVersion = null)
 * @method Apeschool|null findOneBy(array $criteria, array $orderBy = null)
 * @method Apeschool[]    findAll()
 * @method Apeschool[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ApeschoolRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Apeschool::class);
    }

    // /**
    //  * @return Apeschool[] Returns an array of Apeschool objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Apeschool
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
