<!DOCTYPE html>
<html>
<head>
 <title>GPNU</title>
 <meta charset="UTF-8">
 <meta http-equiv="refresh" content="5"> <!-- 刷新页面的时间间隔为1秒 -->
</head>
<body>
 <?php
 $file = "GPNU.log"; // 要输出内容的文件名
 $handle = fopen($file, "r"); // 打开文件
 if ($handle) {
  while (($line = fgets($handle)) !== false) { // 逐行读取文件内容并输出
   echo $line . "<br>";
  }
  fclose($handle); // 关闭文件
 } else {
  echo "无法打开文件！";
 }
 ?>
</body>
</html>