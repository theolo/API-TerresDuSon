<?php
header("Access-Control-Allow-Origin: http://localhost:8888/API-TerresDuSon/");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


include_once '../config/database.php';
include_once './user.php';
// $nom = '';
// $password = '';
// $email = '';
// $Role_utilisateur_id = null;
// $connection = null;

$database = new DatabaseService();
$conn = $database->getConnection();

$user = new ObjUser($conn);

$data = json_decode(file_get_contents("php://input"));

$user->nom = $data->nom;
$user->password = $data->password;
$user->email = $data->email;
$user->Role_utilisateur_id = $data->Role_utilisateur_id;

$user->create();

// create the user
// if($user->create()){
 
//     // set response code
//     http_response_code(200);
 
//     // display message: user was created
//     echo json_encode(array("message" => "User was created."));
// }
 
// // message if unable to create user
// else{
 
//     // set response code
//     http_response_code(200);
 
//     // display message: unable to create user
//     echo json_encode(array("message" => "Unable to create user."));
// }

// $table_name = 'utilisateur';

// $query = "INSERT INTO " . $table_name . "
//                 SET nom = :nom,
//                     password = :password,
//                     email = :email,
//                     Role_utilisateur_id = :role";
                    
// $stmt = $conn->prepare($query);

// $stmt->bindParam(':nom', $nom);
// $stmt->bindParam(':password', $password);
// $stmt->bindParam(':email', $email);
// $stmt->bindParam(':role', $Role_utilisateur_id);

// $stmt->execute();



?>