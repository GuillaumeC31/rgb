<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EntStudAcceptRepository")
 */
class EntStudAccept
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $ent_id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $stud_id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $accept;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEntId(): ?int
    {
        return $this->ent_id;
    }

    public function setEntId(?int $ent_id): self
    {
        $this->ent_id = $ent_id;

        return $this;
    }

    public function getStudId(): ?int
    {
        return $this->stud_id;
    }

    public function setStudId(?int $stud_id): self
    {
        $this->stud_id = $stud_id;

        return $this;
    }

    public function getAccept(): ?string
    {
        return $this->accept;
    }

    public function setAccept(?string $accept): self
    {
        $this->accept = $accept;

        return $this;
    }
}
