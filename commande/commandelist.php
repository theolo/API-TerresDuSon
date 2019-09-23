<?php
require '../config/cors.php';

include_once '../config/database.php';
include_once './categorie.php';

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT commande.id
                            FROM link_member_command
                            JOIN command ON link_member_command.id_command=command.id
                            JOIN member ON link_member_command.id_member=member.id 
                            WHERE command.status = 0 
                            and member.id=CURRENT_USER"
                            );
$statement->execute();
$categories_arr = [];
foreach($statement->fetchAll() as $val) {
    $categories_arr[] = new panier($val["id"]);
}

echo json_encode($categories_arr);

?>