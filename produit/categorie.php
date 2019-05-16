<?php

class categorie {
    public $id, $title, $description, $imageUrl, $deadline;
    public function __construct($id, $title, $description, $imageUrl, $deadline) {
        $this->id = $id;
        $this->title = $title;
        $this->description = $description;
        $this->imageUrl= $imageUrl;
        $this->deadline = $deadline;
    }
}

?>