<?php
require '../config/cors.php';

class ObjUser{
    // database connection and table name
    private $conn;
    private $table_name = "member";

    // object properties
    public $id, $name_member, $pass, $valid, $email, $admin, $budget, $id_role, $date;
    
    public function __construct($conne){
        $this->conn = $conne;
    }

    // create new user record
    function create(){
    
        // insert query
        $query = "INSERT INTO " . $this->table_name . "
                            SET name_member = :name_member,
                            pass = :pass,
                            email = :email,
                            id_role = :id_role";
    
        // prepare the query
        $stmt = $this->conn->prepare($query);
    
        // sanitize
        $this->name_member=htmlspecialchars(strip_tags($this->name_member));
        $this->pass=htmlspecialchars(strip_tags($this->pass));
        $this->email=htmlspecialchars(strip_tags($this->email));
        // $this->role=htmlspecialchars(strip_tags($this->role));
    
        // bind the values
        $stmt->bindParam(':name_member', $this->name_member);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':id_role', $this->id_role);
    
        // hash the password before saving to database
        $password_hash = password_hash($this->pass, PASSWORD_BCRYPT);
        $stmt->bindParam(':pass', $password_hash);
    
        // execute the query, also check if query was successful
        if($stmt->execute()){
            return true;
        }
    
        return false;
    }

    // check if given email exist in the database
    function emailExists(){
    
        // query to check if email exists
        $query = "SELECT id, name_member, pass, valid, email, admin, budget, id_role, creation_date
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
            $this->nom = $row['name_member'];
            $this->password = $row['pass'];
            $this->valid = $row['valid'];
            $this->email = $row['email'];
            $this->admin = $row['admin'];
            $this->budget = $row['budget'];
            $this->role = $row['id_role'];
            $this->date = $row['creation_date'];
            // return true because email exists in the database
            return true;
        }
    
        // return false if email does not exist in the database
        return false;
    }


    function list() {
        $statement = $this->conn->prepare("SELECT member.id, member.name_member as nom, member.pass, member.valid, member.email, member.admin, member.budget, role.name_role as role, member.creation_date as date
                                FROM member join role ON
                                member.id_role=role.id");
        $statement->execute();
        $user_arr = [];
        foreach($statement->fetchAll() as $val) {
            $obj = new stdClass;
            $obj->id = $val["id"];
            $obj->nom = $val["nom"];
            $obj->password = $val["pass"];
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