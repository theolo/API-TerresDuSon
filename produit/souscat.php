<?php

class sousCategorie {
    public $id, $title, $description, $imageUrl, $categorie, $categories_id;
    public function __construct($id, $title, $description, $imageUrl, $categorie, $categories_id) {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->imageUrl= $imageUrl;
        $this->categorie = $categorie;
        $this->categories_id = $categories_id;
    }
}

?>