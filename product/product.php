<?php
require '../config/cors.php';

class produit {
    public $id, $produit, $prix, $unit, $stock, $fournisseur, $adresse, $sous_categorie_id;
    public function __construct($id, $produit, $prix, $unit, $stock, $fournisseur, $adresse, $sous_categorie_id) {
        $this->id = $id;
        $this->produit = $produit;
        $this->prix = $prix;
        $this->unit = $unit;
        $this->stock = $stock;
        $this->fournisseur = $fournisseur;
        $this->adresse = $adresse;
        $this->sous_categorie_id = $sous_categorie_id;
    }
}
?>