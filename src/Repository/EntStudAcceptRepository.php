<?php

namespace App\Repository;

use App\Entity\EntStudAccept;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method EntStudAccept|null find($id, $lockMode = null, $lockVersion = null)
 * @method EntStudAccept|null findOneBy(array $criteria, array $orderBy = null)
 * @method EntStudAccept[]    findAll()
 * @method EntStudAccept[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EntStudAcceptRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EntStudAccept::class);
    }

    // /**
    //  * @return EntStudAccept[] Returns an array of EntStudAccept objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?EntStudAccept
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
