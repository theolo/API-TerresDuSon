<?php
require '../config/cors.php';

include_once '../config/database.php';
include_once './categorie.php';

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

?>