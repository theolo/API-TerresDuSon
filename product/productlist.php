<?php
require '../config/cors.php';

include_once '../config/database.php';
include_once './product.php';

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT product.id, product.name_product as produit, product.price, product.unit as unit, product.stock, provider.name_provider as fournisseur, concat(provider.adress, provider.town, provider.zip_code) as adresse, product.id_sub_category
                            from product,provider where product.id_provider=provider.id");

$statement->execute();


$product_arr = [];
// var_dump($statement->fetchAll());

foreach($statement->fetchAll() as $val) {
    $product_arr[] = new produit($val["id"],$val["produit"], $val["price"],$val["unit"], $val["stock"], $val["fournisseur"], $val["adresse"], $val["id_sub_category"]);
}

echo json_encode($product_arr);
// return $product_arr;

?>