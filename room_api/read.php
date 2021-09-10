<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    
    include_once '../config/database.php';
    include_once '../class/room.php';

    $database = new Database();
    $db = $database->getConnection();

    $items = new room($db);

    $stmt = $items->getrooms();
    $itemCount = $stmt->rowCount();


    echo json_encode($itemCount);

    if($itemCount > 0){
        
        $roomArr = array();
        $roomArr["body"] = array();
        $roomArr["itemCount"] = $itemCount;

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "roomid" => $roomid,
                "room_name" => $room_name,
                "room_background" => $room_background,
            );

            array_push($roomArr["body"], $e);
        }
        echo json_encode($roomArr);
    }

    else{
        http_response_code(404);
        echo json_encode(
            array("message" => "No record found.")
        );
    }
?>