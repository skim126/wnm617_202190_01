<?php

function makeConn() {
   include "auth.php";
   try {
      $conn = new PDO(...Auth());
      $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
      return $conn;
   } catch(PDOException $e) {
      die('{"error":"'.$e->getMessage().'"}');
   }
}


/* $r = PDO result */
function fetchAll($r) {
   $a = [];
   while($row = $r->fetch(\PDO::FETCH_OBJ)) $a[] = $row;
   return $a;
}

/*
$c = connection
$ps = prepared statement
$p = parameters
*/
function makeQuery($c,$ps,$p,$makeResults=true) {
   try {
      if(count($p)) {
         $stmt = $c->prepare($ps);
         $stmt->execute($p);
      } else {
         $stmt = $c->query($ps);
      }
      $r = $makeResults ? fetchAll($stmt) : [];
      return [
         // "statement"=>$ps,
         // "params"=>$p,
         "result"=>$r
      ];
   } catch(PDOException $e) {
      return ["error"=>"Query Failed: ".$e->getMessage()];
   }
}


function makeUpload($file,$folder) {
   $filename = microtime(true) . "_" . $_FILES[$file]['name'];

   if(@move_uploaded_file(
      $_FILES[$file]['tmp_name'],
      $folder.$filename
   )) return ['result'=>$filename];
   else return [
      "error"=>"File Upload Failed",
      "_FILES"=>$_FILES,
      "filename"=>$filename
   ];
}


function makeStatement($data) {
   try{
      $c = makeConn();
      $t = @$data->type;
      $p = @$data->params;

      switch($t) {
         // case "users_all":
         //    return makeQuery($c,"SELECT * FROM `track_users`",$p);
         // case "restrooms_all":
         //    return makeQuery($c,"SELECT * FROM `track_restrooms`",$p);
         // case "locations_all":
         //    return makeQuery($c,"SELECT * FROM `track_locations`",$p);

         //CRUD

         /* Read */

         case "user_by_id":
            return makeQuery($c,"SELECT id,username,name,email,img FROM `track_users` WHERE `id`=?",$p);
         case "restroom_by_id":
            return makeQuery($c,"SELECT * FROM `track_restrooms` WHERE `id`=?",$p);
         case "location_by_id":
            return makeQuery($c,"SELECT * FROM `track_locations` WHERE `id`=?",$p);

         case "restrooms_by_user_id":
            return makeQuery($c,"SELECT * FROM `track_restrooms` WHERE `user_id`=?",$p);
         case "locations_by_restroom_id":
            return makeQuery($c,"SELECT * FROM `track_locations` WHERE `restroom_id`=?",$p);

         case "check_signin":
            return makeQuery($c,"SELECT id FROM `track_users` WHERE `username`=? And `password`=md5(?)",$p);

         case "home_restroom_locations":
            return makeQuery($c,"SELECT *
               FROM `track_restrooms` a
               JOIN (
                  SELECT lg.*
                  FROM `track_locations` lg
                  WHERE lg.id = (
                     SELECT lt.id
                     FROM `track_locations` lt
                     WHERE lt.restroom_id = lg.restroom_id
                     ORDER BY lt.date_create DESC
                     LIMIT 1
                  )
               ) l
               ON a.id = l.restroom_id
               WHERE a.user_id = ?
               ORDER BY l.restroom_id, l.date_create DESC
               ",$p);

         case "search_restrooms":
            $p = ["%$p[0]%",$p[1]];
            return makeQuery($c,"SELECT *
               FROM `track_restrooms`
               WHERE
                  `store` LIKE ? AND
                  `user_id` = ?
                  ",$p);

         case "filter_restrooms":
            return makeQuery($c,"SELECT *
               FROM `track_restrooms`
               WHERE
                  `$p[0]` = ? AND
                  `user_id` = ?
                  ",[$p[1],$p[2]]);   

         /* Create */

         case "insert_user":
            $r = makeQuery($c,"SELECT id FROM `track_users` WHERE `username`=? OR `email` = ?",[$p[0],$p[1]]);
            if(count($r['result'])) return ["error" => "Username or Email already exists"];

            $r = makeQuery($c,"INSERT INTO
               `track_users`
               (`username`, `email`, `password`, `img`, `date_create`)
               VALUES
               (?, ?, md5(?), 'http://via.placeholder.com/400/?text=USER', NOW())
               ",$p,false);
            return ["id" => $c->lastInsertId()];


         case "insert_restroom":
            $r = makeQuery($c,"INSERT INTO
               `track_restrooms`
               (`user_id`, `store`, `type`, `needs`, `description`, `img`, `password`, `date_create`)
               VALUES
               (?, ?, ?, ?, ?, 'http://via.placeholder.com/400/?text=RESTROOM', ?, NOW())
               ",$p,false);
            return ["id" => $c->lastInsertId()];

         case "insert_location":
            $r = makeQuery($c,"INSERT INTO
               `track_locations`
               (`restroom_id`, `lat`, `lng`, `description`, `photo`, `icon`, `date_create`)
               VALUES
               (?, ?, ?, ?, 'http://via.placeholder.com/400/?text=PHOTO', 'http://via.placeholder.com/400/?text=ICON', NOW())
               ",$p,false);
            return ["id" => $c->lastInsertId()];

         /* Update */

         case "update_user":
            $r = makeQuery($c,"UPDATE
               `track_users`
               SET
                  `name` = ?,
                  `username` = ?,
                  `email` = ?
               WHERE `id` = ?
               ",$p,false);
            return ["result" => "success"];


         case "update_user_onboard":
            $r = makeQuery($c,"UPDATE
               `track_users`
               SET
                  `img` = ?               
                  `name` = ?,
               WHERE `id` = ?
               ",$p,false);
            return ["result" => "success"];   

         case "update_user_password":
            $r = makeQuery($c,"UPDATE
               `track_users`
               SET
                  `password` = md5(?)
               WHERE `id` = ?
               ",$p,false);
            return ["result" => "success"];

         case "update_user_image":
            $r = makeQuery($c,"UPDATE
               `track_users`
               SET `img` = ?
               WHERE `id` = ?
               ",$p,false);
         return ["result" => "success"];   

         case "update_restroom":
            $r = makeQuery($c,"UPDATE
               `track_restrooms`
               SET
                  `store` = ?,
                  `type` = ?,
                  `needs` = ?,
                  `description` = ?,
                  `password` = ?
               WHERE `id` = ?
               ",$p,false);
            return ["result" => "success"];

         case "update_restroom_image":
            $r = makeQuery($c,"UPDATE
               `track_restrooms`
               SET `img` = ?
               WHERE `id` = ?
               ",$p,false);
         return ["result" => "success"];   

         case "update_location":
            $r = makeQuery($c,"UPDATE
               `track_locations`
               SET
                  `description` = ?
               WHERE `id` = ?
               ",$p,false);
            return ["result" => "success"];


         /* Delete */

         case "delete_restroom":
            $r = makeQuery($c,"DELETE FROM
               `track_restrooms`
               WHERE `id` = ?
               ",$p,false);
            return ["result" => "success"];

         case "delete_location":
            $r = makeQuery($c,"DELETE FROM
               `track_locations`
               WHERE `id` = ?
               ",$p,false);
            return ["result" => "success"];    

         default: return ["error"=>"No Matched Type"];
      }
   } catch(Exception $e) {
      return ["error"=>"Bad Data"];
   }
}

if(!empty($_FILES)) {
   $r = makeUpload("image","../uploads/");
   die(json_encode($r));
}

$data = json_decode(file_get_contents("php://input"));

die(
   json_encode(
      makeStatement($data),
      JSON_NUMERIC_CHECK
   )
);