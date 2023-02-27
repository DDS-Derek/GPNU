<!DOCTYPE html>
<html>
<head>
 <title>GPNU</title>
 <meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
  <div id="log-content"></div>
 </div>
 <script>
  $(document).ready(function() {
    setInterval(function() {
      $.get("GPNU.txt", function(data) { // 通过Ajax获取文件内容
        $("#log-content").html(data); // 更新页面内容
      });
    }, 5000); // 每隔5秒钟执行一次
  });
 </script>
</body>
</html>
