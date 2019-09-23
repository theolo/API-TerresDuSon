<?php
require '../config/cors.php';

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
        // $this->role=htmlspecialchars(strip_tags($this->role));
    
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

    // check if given email exist in the database
    function emailExists(){
    
        // query to check if email exists
        $query = "SELECT id, nom, password, valid, email, admin, budget, Role_utilisateur_id, date_ajout
                FROM " . $this->table_name . "
                WHERE email = ?
                LIMIT 0,1";
    
        // prepare the query
        $stmt = $this->conn->prepare( $query );
    
        // sanitize
        $this->email=htmlspecialchars(strip_tags($this->email));
    
        // bind given email value
        $stmt->bindParam(1, $this->email);
    
        // execute the query
        $stmt->execute();
    
        // get number of rows
        $num = $stmt->rowCount();
    
        // if email exists, assign values to object properties for easy access and use for php sessions
        if($num>0){
    
            // get record details / values
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
            // assign values to object properties
            $this->id = $row['id'];
            $this->nom = $row['nom'];
            $this->password = $row['password'];
            $this->valid = $row['valid'];
            $this->email = $row['email'];
            $this->admin = $row['admin'];
            $this->budget = $row['budget'];
            $this->role = $row['Role_utilisateur_id'];
            $this->date = $row['date_ajout'];
            // return true because email exists in the database
            return true;
        }
    
        // return false if email does not exist in the database
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