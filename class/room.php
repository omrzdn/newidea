<?php
    class room{

        // Connection
        private $conn;

        // Table
        private $db_table = "room";

        // Columns
        public $roomid;
        public $room_name;
        public $ownerid;
        public $room_background;

        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }

        // GET ALL
        public function getrooms(){
            $sqlQuery = "SELECT roomid, room_name, ownerid, room_background FROM " . $this->db_table . "";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->execute();
            return $stmt;
        }

        // CREATE
        public function createroom(){
            $sqlQuery = "INSERT INTO
                        ". $this->db_table ."
                    SET
                        room_name = :room_name, 
                        ownerid = :id,
                        room_background = :room_background";
        
            $stmt = $this->conn->prepare($sqlQuery);
        
            // sanitize
            $this->room_name=htmlspecialchars(strip_tags($this->name));
            $this->room_background=htmlspecialchars(strip_tags($this->room_background));
        
            // bind data
            $stmt->bindParam(":room_name", $this->room_name);
            $stmt->bindParam(":room_background", $this->room_background);
        
            if($stmt->execute()){
               return true;
            }
            return false;
        }

        // UPDATE
        public function getSingleuser(){
            $sqlQuery = "SELECT
                        roomid, 
                        room_name,
                        ownerid,
                        room_background, 
                      FROM
                        ". $this->db_table ."
                    WHERE 
                       roomid = ?
                    LIMIT 0,1";

            $stmt = $this->conn->prepare($sqlQuery);

            $stmt->bindParam(1, $this->roomid);

            $stmt->execute();

            $dataRow = $stmt->fetch(PDO::FETCH_ASSOC);
            
            $this->name = $dataRow['room_name'];
            $this->phone = $dataRow['room_background'];
        }        

        // UPDATE
        public function updateuser(){
            $sqlQuery = "UPDATE
                        ". $this->db_table ."
                    SET
                        room_name = :room_name, 
                        room_background = :room_background, 
                    WHERE 
                        roomid = :roomid";
        
            $stmt = $this->conn->prepare($sqlQuery);
        
            $this->room_name=htmlspecialchars(strip_tags($this->room_name));
            $this->room_background=htmlspecialchars(strip_tags($this->room_background));
        
            // bind data
            $stmt->bindParam(":room_name", $this->room_name);
            $stmt->bindParam(":room_background", $this->room_background);
            $stmt->bindParam(":roomid", $this->roomid);
        
            if($stmt->execute()){
               return true;
            }
            return false;
        }

        // DELETE
        function deleteuser(){
            $sqlQuery = "DELETE FROM " . $this->db_table . " WHERE roomid = ?";
            $stmt = $this->conn->prepare($sqlQuery);
        
            $this->roomid=htmlspecialchars(strip_tags($this->roomid));
        
            $stmt->bindParam(1, $this->roomid);
        
            if($stmt->execute()){
                return true;
            }
            return false;
        }

    }
?>

