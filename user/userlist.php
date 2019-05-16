<?php
include_once '../config/database.php';
include_once './user.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT utilisateur.id, utilisateur.nom as nom, utilisateur.password, utilisateur.valid, utilisateur.email, utilisateur.admin, utilisateur.budget, Role_utilisateur.nom as role, utilisateur.date_ajout as date
                            FROM utilisateur join Role_utilisateur ON
                            utilisateur.Role_utilisateur_id=Role_utilisateur.id");
$statement->execute();
$user_arr = [];
foreach($statement->fetchAll() as $val) {
    $user_arr[] = new user($val["id"], $val["nom"], $val["password"], $val["valid"], $val["email"], $val["admin"], $val["budget"], $val["role"], $val["date"]);
}

echo json_encode($user_arr);

?>