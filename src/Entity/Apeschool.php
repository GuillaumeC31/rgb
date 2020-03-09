<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ApeschoolRepository")
 */
class Apeschool
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
    private $school_id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $code;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nameape;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSchoolId(): ?int
    {
        return $this->school_id;
    }

    public function setSchoolId(?int $school_id): self
    {
        $this->school_id = $school_id;

        return $this;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(?string $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getNameape(): ?string
    {
        return $this->nameape;
    }

    public function setNameape(string $nameape): self
    {
        $this->nameape = $nameape;

        return $this;
    }
}
