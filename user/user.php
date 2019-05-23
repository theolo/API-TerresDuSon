<?php



class ObjUser{
    // database connection and table name
    private $conn;
    private $table_name = "utilisateur";

    // object properties
    public $id, $nom, $password, $valid, $email, $admin, $budget, $role, $date;
    
    public function __construct($conne){
        $this->conn = $conne;
    }

    // create new user record
function create(){
 
    // insert query
    $query = "INSERT INTO " . $this->table_name . "
                        SET nom = :nom,
                        password = :password,
                        email = :email,
                        Role_utilisateur_id = :role";
 
    // prepare the query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->nom=htmlspecialchars(strip_tags($this->nom));
    $this->password=htmlspecialchars(strip_tags($this->password));
    $this->email=htmlspecialchars(strip_tags($this->email));
    $this->role=htmlspecialchars(strip_tags($this->role));
 
    // bind the values
    $stmt->bindParam(':nom', $this->nom);
    $stmt->bindParam(':email', $this->email);
    $stmt->bindParam(':role', $this->role);
 
    // hash the password before saving to database
    $password_hash = password_hash($this->password, PASSWORD_BCRYPT);
    $stmt->bindParam(':password', $password_hash);
 
    // execute the query, also check if query was successful
    if($stmt->execute()){
        return true;
    }
 
    return false;
}

function list() {
    $statement = $this->conn->prepare("SELECT utilisateur.id, utilisateur.nom as nom, utilisateur.password, utilisateur.valid, utilisateur.email, utilisateur.admin, utilisateur.budget, Role_utilisateur.nom as role, utilisateur.date_ajout as date
                            FROM utilisateur join Role_utilisateur ON
                            utilisateur.Role_utilisateur_id=Role_utilisateur.id");
$statement->execute();
$user_arr = [];
foreach($statement->fetchAll() as $val) {
    $obj = new stdClass;
    $obj->id = $val["id"];
    $obj->nom = $val["nom"];
    $obj->password = $val["password"];
    $obj->valid = $val["valid"];
    $obj->email = $val["email"];
    $obj->admin = $val["admin"];
    $obj->budget = $val["budget"];
    $obj->role = $val["role"];
    $obj->date = $val["date"];
    // {'id' => $val["id"], 'nom'=>$val["nom"], 'password' => $val["password"], $val["valid"], $val["email"], $val["admin"], $val["budget"], $val["role"], $val["date"]};
    $user_arr[] = $obj;
}
return json_encode($user_arr);

}
}

?>