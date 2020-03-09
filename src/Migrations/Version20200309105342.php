<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200309105342 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE admin (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ape (id INT AUTO_INCREMENT NOT NULL, code VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE apeschool (id INT AUTO_INCREMENT NOT NULL, school_id INT DEFAULT NULL, code VARCHAR(255) DEFAULT NULL, nameape VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE city (id INT AUTO_INCREMENT NOT NULL, department VARCHAR(255) NOT NULL, city VARCHAR(255) NOT NULL, zipcode INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE enterprise (id INT AUTO_INCREMENT NOT NULL, identity VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ent_stud_accept (id INT AUTO_INCREMENT NOT NULL, ent_id INT DEFAULT NULL, stud_id INT DEFAULT NULL, accept INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE framework (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE langages (id INT AUTO_INCREMENT NOT NULL, langage VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messages (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, content VARCHAR(255) NOT NULL, user_id INT NOT NULL, created_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE school (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE section (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, id_school VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE student (id INT AUTO_INCREMENT NOT NULL, lastname VARCHAR(255) NOT NULL, firstname VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE uploads (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, file_path VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, user_id INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE users (id INT AUTO_INCREMENT NOT NULL, firstname VARCHAR(255) DEFAULT NULL, lastname VARCHAR(255) DEFAULT NULL, address VARCHAR(255) DEFAULT NULL, zipcode INT DEFAULT NULL, city VARCHAR(255) DEFAULT NULL, phone VARCHAR(255) DEFAULT NULL, birthdate DATE DEFAULT NULL, mark INT DEFAULT NULL, date_registration DATETIME NOT NULL, email VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, web VARCHAR(255) DEFAULT NULL, github VARCHAR(255) DEFAULT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', identity VARCHAR(255) DEFAULT NULL, adress_pro VARCHAR(255) DEFAULT NULL, zipcode_pro VARCHAR(255) DEFAULT NULL, city_pro VARCHAR(255) DEFAULT NULL, phone_pro VARCHAR(255) DEFAULT NULL, web_pro VARCHAR(255) DEFAULT NULL, siret BIGINT DEFAULT NULL, siren BIGINT DEFAULT NULL, nic INT DEFAULT NULL, ape_code VARCHAR(6) DEFAULT NULL, section_id INT DEFAULT NULL, school VARCHAR(255) DEFAULT NULL, formation VARCHAR(255) DEFAULT NULL, email_pro VARCHAR(255) DEFAULT NULL, connect VARCHAR(255) DEFAULT NULL, departement VARCHAR(255) DEFAULT NULL, code_departement INT DEFAULT NULL, region VARCHAR(255) DEFAULT NULL, activite VARCHAR(255) DEFAULT NULL, ape_name VARCHAR(255) DEFAULT NULL, user_id INT NOT NULL, photo_profile_id INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE admin');
        $this->addSql('DROP TABLE ape');
        $this->addSql('DROP TABLE apeschool');
        $this->addSql('DROP TABLE city');
        $this->addSql('DROP TABLE enterprise');
        $this->addSql('DROP TABLE ent_stud_accept');
        $this->addSql('DROP TABLE framework');
        $this->addSql('DROP TABLE langages');
        $this->addSql('DROP TABLE messages');
        $this->addSql('DROP TABLE school');
        $this->addSql('DROP TABLE section');
        $this->addSql('DROP TABLE student');
        $this->addSql('DROP TABLE uploads');
        $this->addSql('DROP TABLE users');
    }
}
