<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200307212447 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE apeschool (id INT AUTO_INCREMENT NOT NULL, school_id INT DEFAULT NULL, code VARCHAR(255) DEFAULT NULL, nameape VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE ent_stud_accept DROP FOREIGN KEY ent_stud_accept_ibfk_1');
        $this->addSql('ALTER TABLE ent_stud_accept DROP FOREIGN KEY ent_stud_accept_ibfk_2');
        $this->addSql('DROP INDEX ent_id ON ent_stud_accept');
        $this->addSql('DROP INDEX stud_id ON ent_stud_accept');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE apeschool');
        $this->addSql('ALTER TABLE ent_stud_accept ADD CONSTRAINT ent_stud_accept_ibfk_1 FOREIGN KEY (ent_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE ent_stud_accept ADD CONSTRAINT ent_stud_accept_ibfk_2 FOREIGN KEY (stud_id) REFERENCES users (id)');
        $this->addSql('CREATE INDEX ent_id ON ent_stud_accept (ent_id)');
        $this->addSql('CREATE INDEX stud_id ON ent_stud_accept (stud_id)');
    }
}
