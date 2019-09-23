<?php
require '../config/cors.php';

include_once '../config/database.php';
include_once './categorie.php';

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$statement = $conn->prepare("SELECT commande.id_commande 
                            FROM utilisateur_has_commande 
                            JOIN commande ON utilisateur_has_commande.commande_id_commande=commande.id_commande 
                            JOIN utilisateur ON utilisateur_has_commande.utilisateur_id=utilisateur.id 
                            WHERE commande.statut = 0 
                            and utilisateur.id=CURRENT_USER"
                            );
$statement->execute();
$categories_arr = [];
foreach($statement->fetchAll() as $val) {
    $categories_arr[] = new panier($val["id"]);
}

echo json_encode($categories_arr);

?>