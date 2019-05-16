<?php
include_once '../../../config/database.php';
include_once './product.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT Designation.id,Designation.nom as produit ,Designation.prix ,Designation.unit as unit ,Designation.stock,fournisseur.nom as fournisseur, concat(fournisseur.adresse,fournisseur.ville,fournisseur.cp) as adresse from Designation,fournisseur where Designation.fournisseur_id=fournisseur.id");
$statement->execute();
$product_arr = [];

foreach($statement->fetchAll() as $val) {
    $product_arr[] = new produit($val["id"],$val["produit"], $val["prix"],$val["unit"], $val["stock"], $val["fournisseur"], $val["adresse"]);
}

echo json_encode($product_arr);
// return $product_arr;

?>