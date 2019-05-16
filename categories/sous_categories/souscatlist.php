<?php
include_once '../../config/database.php';
include_once './souscat.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT sous_categories.id, sous_categories.title, sous_categories.description, sous_categories.imageUrl, categories.title as categorie, sous_categories.categories_id
                            FROM sous_categories JOIN categories ON
                            sous_categories.categories_id=categories.id
                            ");
$statement->execute();
$souscat_arr = [];
foreach($statement->fetchAll() as $val) {
    $souscat_arr[] = new sousCategorie($val["id"], $val["title"], $val["description"], $val["imageUrl"], $val["categorie"], $val["categories_id"]);
}

echo json_encode($souscat_arr);

?>