<?php
require '../config/cors.php';

include_once '../config/database.php';
include_once './souscat.php';

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT sub_category.id, sub_category.title, sub_category.description, sub_category.imageUrl, category.title as category, sub_category.id_category
                            FROM sub_category JOIN category ON
                            sub_category.id_category=category.id
                            ");
$statement->execute();
$souscat_arr = [];
foreach($statement->fetchAll() as $val) {
    $souscat_arr[] = new sousCategorie($val["id"], $val["title"], $val["description"], $val["imageUrl"], $val["category"], $val["id_category"]);
}

echo json_encode($souscat_arr);

?>