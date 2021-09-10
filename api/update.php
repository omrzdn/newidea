<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
    
    include_once '../config/database.php';
    include_once '../class/users.php';
    
    $database = new Database();
    $db = $database->getConnection();
    
    $item = new user($db);
    
    $data = json_decode(file_get_contents("php://input"));
    
    $item->id = $data->id;
    
    // user values
    $item->name = $data->name;
    $item->phone = $data->phone;
    
    if($item->updateuser()){
        echo json_encode("user data updated.");
    } else{
        echo json_encode("Data could not be updated");
    }
?>