<?php
require '../config/cors.php';

class commande {
    public $id;
    public function __construct($id) {
        $this->id = $id;
    }
}

?>