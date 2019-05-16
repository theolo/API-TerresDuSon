<?php

class produit {
    public $id,$produit,$prix,$unit,$stock,$fournisseur,$adresse;
    public function __construct($id,$produit,$prix,$unit,$stock,$fournisseur,$adresse) {
        $this->id = $id;
        $this->produit = $produit;
        $this->prix = $prix;
        $this->unit = $unit;
        $this->stock = $stock;
        $this->fournisseur = $fournisseur;
        $this->adresse = $adresse;
       
}
}
?>