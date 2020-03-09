<?php

namespace App\Repository;

use App\Entity\Ape;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Ape|null find($id, $lockMode = null, $lockVersion = null)
 * @method Ape|null findOneBy(array $criteria, array $orderBy = null)
 * @method Ape[]    findAll()
 * @method Ape[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ApeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Ape::class);
    }

    // /**
    //  * @return Ape[] Returns an array of Ape objects
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
    public function findOneBySomeField($value): ?Ape
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
