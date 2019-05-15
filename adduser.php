<?php
include_once './config/database.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$nom = '';
$password = '';
$email = '';
$Role_utilisateur_id = null;
$connection = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

$nom = $data->nom;
$password = $data->password;
$email = $data->email;
$Role_utilisateur_id = $data->Role_utilisateur_id;

$table_name = 'utilisateur';

$query = "INSERT INTO " . $table_name . "
                SET nom = :nom,
                    password = :password,
                    email = :email,
                    Role_utilisateur_id = :role";
                    
$stmt = $conn->prepare($query);

$stmt->bindParam(':nom', $nom);
$stmt->bindParam(':password', $password);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':role', $Role_utilisateur_id);

$stmt->execute();



?>