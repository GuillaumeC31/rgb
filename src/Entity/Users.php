<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UsersRepository")
 */
class Users implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $firstname;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $lastname;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $address;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $zipcode;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $city;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $phone;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $birthdate;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $mark;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date_registration;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $web;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $github;

    /**
     * @ORM\Column(type="json")
     */
    private $roles;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $identity;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $adress_pro;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $zipcode_pro;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $city_pro;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $phone_pro;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $web_pro;

    /**
     * @ORM\Column(type="bigint", nullable=true)
     */
    private $siret;

    /**
     * @ORM\Column(type="bigint", nullable=true)
     */
    private $siren;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $nic;

    /**
     * @ORM\Column(type="string", length=6, nullable=true)
     */
    private $ape_code;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $section_id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $school;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $formation;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $email_pro;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $connect;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $departement;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $code_departement;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $region;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $activite;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $ape_name;



    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Fonction obligatiore via le UserInterface, retourne l'adresse email de l'utilisateur
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(?string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(?string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getZipcode(): ?int
    {
        return $this->zipcode;
    }

    public function setZipcode(?int $zipcode): self
    {
        $this->zipcode = $zipcode;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(?string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function setPhone(?string $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getBirthdate(): ?\DateTimeInterface
    {
        return $this->birthdate;
    }

    public function setBirthdate(?\DateTimeInterface $birthdate): self
    {
        $this->birthdate = $birthdate;

        return $this;
    }

    public function getMark(): ?int
    {
        return $this->mark;
    }

    public function setMark(?int $mark): self
    {
        $this->mark = $mark;

        return $this;
    }

    public function getDateRegistration(): ?\DateTimeInterface
    {
        return $this->date_registration;
    }

    public function setDateRegistration(\DateTimeInterface $date_registration): self
    {
        $this->date_registration = $date_registration;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getWeb(): ?string
    {
        return $this->web;
    }

    public function setWeb(?string $web): self
    {
        $this->web = $web;

        return $this;
    }

    public function getGithub(): ?string
    {
        return $this->github;
    }

    public function setGithub(?string $github): self
    {
        $this->github = $github;

        return $this;
    }

    public function getIdentity(): ?string
    {
        return $this->identity;
    }

    public function setIdentity(?string $identity): self
    {
        $this->identity = $identity;

        return $this;
    }

    public function getAdressPro(): ?string
    {
        return $this->adress_pro;
    }

    public function setAdressPro(?string $adress_pro): self
    {
        $this->adress_pro = $adress_pro;

        return $this;
    }

    public function getZipcodePro(): ?string
    {
        return $this->zipcode_pro;
    }

    public function setZipcodePro(?string $zipcode_pro): self
    {
        $this->zipcode_pro = $zipcode_pro;

        return $this;
    }

    public function getCityPro(): ?string
    {
        return $this->city_pro;
    }

    public function setCityPro(?string $city_pro): self
    {
        $this->city_pro = $city_pro;

        return $this;
    }

    public function getPhonePro(): ?string
    {
        return $this->phone_pro;
    }

    public function setPhonePro(?string $phone_pro): self
    {
        $this->phone_pro = $phone_pro;

        return $this;
    }

    public function getWebPro(): ?string
    {
        return $this->web_pro;
    }

    public function setWebPro(?string $web_pro): self
    {
        $this->web_pro = $web_pro;

        return $this;
    }

    public function getSiret(): ?string
    {
        return $this->siret;
    }

    public function setSiret(?string $siret): self
    {
        $this->siret = $siret;

        return $this;
    }

    public function getSiren(): ?string
    {
        return $this->siren;
    }

    public function setSiren(?string $siren): self
    {
        $this->siren = $siren;

        return $this;
    }

    public function getNic(): ?string
    {
        return $this->nic;
    }

    public function setNic(?string $nic): self
    {
        $this->nic = $nic;

        return $this;
    }

    public function getApeCode(): ?string
    {
        return $this->ape_code;
    }

    public function setApeCode(?string $ape_code): self
    {
        $this->ape_code = $ape_code;

        return $this;
    }

    public function getSectionId(): ?string
    {
        return $this->section_id;
    }

    public function setSectionId(?string $section_id): self
    {
        $this->section_id = $section_id;

        return $this;
    }

    public function getRoles(): array
    {
        $roles = $this->roles;
        #$roles[] = 'ROLE_USER';
        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    public function getSchool(): ?string
    {
        return $this->school;
    }

    public function setSchool(?string $school): self
    {
        $this->school = $school;

        return $this;
    }

    public function getFormation(): ?string
    {
        return $this->formation;
    }

    public function setFormation(?string $formation): self
    {
        $this->formation = $formation;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
    }

    public function getEmailPro(): ?string
    {
        return $this->email_pro;
    }

    public function setEmailPro(?string $email_pro): self
    {
        $this->email_pro = $email_pro;

        return $this;
    }

    public function getConnect(): ?string
    {
        return $this->connect;
    }

    public function setConnect(?string $connect): self
    {
        $this->connect = $connect;

        return $this;
    }

    public function getDepartement(): ?string
    {
        return $this->departement;
    }

    public function setDepartement(?string $departement): self
    {
        $this->departement = $departement;

        return $this;
    }

    public function getCodeDepartement(): ?string
    {
        return $this->code_departement;
    }

    public function setCodeDepartement(?string $code_departement): self
    {
        $this->code_departement = $code_departement;

        return $this;
    }

    public function getRegion(): ?string
    {
        return $this->region;
    }

    public function setRegion(?string $region): self
    {
        $this->region = $region;

        return $this;
    }

    public function getActivite(): ?string
    {
        return $this->activite;
    }

    public function setActivite(?string $activite): self
    {
        $this->activite = $activite;

        return $this;
    }

    public function getApeName(): ?string
    {
        return $this->ape_name;
    }

    public function setApeName(?string $ape_name): self
    {
        $this->ape_name = $ape_name;

        return $this;
    }

}
