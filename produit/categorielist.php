<?php
include_once '../config/database.php';
include_once './categorie.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT id, title, description, imageUrl, deadline
                            FROM categories");
$statement->execute();
$categories_arr = [];
foreach($statement->fetchAll() as $val) {
    $categories_arr[] = new categorie($val["id"], $val["title"], $val["description"], $val["imageUrl"], $val["deadline"]);
}


echo json_encode($categories_arr);
// return $user_arr;

?>