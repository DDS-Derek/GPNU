<!DOCTYPE html>
<html>
<head>
 <title>GPNU</title>
 <meta charset="UTF-8">
 <meta http-equiv="refresh" content="5">
 <style>
  body {
   font-family: Arial, sans-serif;
   background-color: #f5f5f5;
   margin: 0;
   padding: 0;
  }
  h1 {
   font-size: 28px;
   font-weight: bold;
   text-align: center;
   margin-top: 50px;
   margin-bottom: 30px;
  }
  .container {
   max-width: 800px;
   margin: 0 auto;
   padding: 20px;
   background-color: #fff;
   box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
   border-radius: 10px;
  }
  p {
   font-size: 18px;
   line-height: 1.5;
   margin: 0 0 10px;
  }
 </style>
</head>
<body>
 <div class="container">
  <h1>GPNU</h1>
  <?php
   $file = "GPNU.txt"; // 要输出内容的文件名
   $handle = fopen($file, "r"); // 打开文件
   if ($handle) {
    while (($line = fgets($handle)) !== false) { // 逐行读取文件内容并输出
     echo "<p>" . $line . "</p>";
    }
    fclose($handle); // 关闭文件
   } else {
    echo "<p>无法打开文件！</p>";
   }
  ?>
 </div>
</body>
</html>