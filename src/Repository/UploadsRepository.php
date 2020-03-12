<?php

namespace App\Repository;

use App\Entity\Uploads;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Uploads|null find($id, $lockMode = null, $lockVersion = null)
 * @method Uploads|null findOneBy(array $criteria, array $orderBy = null)
 * @method Uploads[]    findAll()
 * @method Uploads[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UploadsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Uploads::class);
    }

     /**
      * @return Uploads[] Returns an array of Uploads objects
      */
    public function findUpload($userId)
    {

        $sql = 'SELECT u.* FROM uploads AS u
                LEFT JOIN users AS p
                ON u.user_id = p.id
                WHERE u.user_id = :userId
                ORDER BY u.created_at DESC';

        $statment = $this->_em->getConnection()->prepare($sql);
        $statment->bindValue(':userId', $userId);
        $statment->execute();
        return $statment->fetchAll();
    }
    

    /*
    public function findOneBySomeField($value): ?Uploads
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
