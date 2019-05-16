<?php

class user {
    public $id, $nom, $password, $valid, $email, $admin, $budget, $role, $date;
    public function __construct($id, $nom, $password, $valid, $email, $admin, $budget, $role, $date) {
        $this->id = $id;
        $this->nom = $nom;
        $this->password = $password;
        $this->valid = $valid;
        $this->email = $email;
        $this->admin = $admin;
        $this->budget = $budget;
        $this->role = $role;
        $this->date = $date;
    }
}

?>