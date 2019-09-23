<?php
require '../config/cors.php';

include_once '../config/database.php';
include_once './product.php';

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT Designation.id, Designation.nom as produit, Designation.prix, Designation.unit as unit, Designation.stock, fournisseur.nom as fournisseur, concat(fournisseur.adresse,fournisseur.ville,fournisseur.cp) as adresse, Designation.sous_categories_id 
                            from Designation,fournisseur where Designation.fournisseur_id=fournisseur.id");

$statement->execute();


$product_arr = [];
// var_dump($statement->fetchAll());

foreach($statement->fetchAll() as $val) {
    $product_arr[] = new produit($val["id"],$val["produit"], $val["prix"],$val["unit"], $val["stock"], $val["fournisseur"], $val["adresse"], $val["sous_categories_id"]);
}

echo json_encode($product_arr);
// return $product_arr;

?>