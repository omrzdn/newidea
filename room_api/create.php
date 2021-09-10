<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    include_once '../config/database.php';
    include_once '../class/room.php';

    $database = new Database();
    $db = $database->getConnection();

    $item = new room($db);

    $data = json_decode(file_get_contents("php://input"));

    $item->room_name = $data->room_name;
    $item->ownerid = $data->id;
    $item->room_background = $data->room_background;
    
    if($item->createroom()){
        echo 'room created successfully.';
    } else{
        echo 'room could not be created.';
    }
?>