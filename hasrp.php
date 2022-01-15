<?php
$servername = "localhost";
$username = "botadmin";
$password = "botadminpass";
$dbname = "bilibili_bot";
$cxstr = $_GET['setstr'];
 
// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
} 
 
$sql = 'SELECT * FROM `omg_replys` WHERE `at_id` = '.$cxstr.'';
$result = $conn->query($sql);
 
if ($result->num_rows > 0) {
    // 输出数据
    while($row = $result->fetch_assoc()) {
		$ok_return['code'] = "200";
		$ok_return['msg'] = "本条数据存在";
        echo json_encode($ok_return,JSON_UNESCAPED_UNICODE);
    }
} else {
	$error_return['code'] = '404';
	$error_return['msg'] = '响应失败,未找到相关内容';
    echo json_encode($error_return,JSON_UNESCAPED_UNICODE);
}
$conn->close();
?>