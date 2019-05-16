<?php
include_once './config/database.php';
include_once './user.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT Designation.id,Designation.nom as produit ,Designation.prix,Designation.unit as unité,Designation.stock ,fournisseur.nom as fournisseur, concat(fournisseur.adresse,fournisseur.ville,fournisseur.cp) as adresse from Designation,fournisseur where Designation.fournisseur_id=fournisseur.id");
$statement->execute();
$user_arr = [];
foreach($statement->fetchAll() as $val) {
    $user_arr[] = new produit($val["id"], $val["produit"], $val["password"], $val["valid"], $val["email"], $val["admin"], $val["budget"], $val["role"], $val["date"]);
}
$this->id = $id;
        $this->produit = $produit;
        $this->prix = $prix;
        $this->unit = $unit;
        $this->fournisseur = $fournisseur;
        $this->adresse = $adresse;

echo json_encode($user_arr);
// return $user_arr;

?>