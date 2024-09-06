<?php
//session_start();
include "modulo.php";
createDataBase();

if(isset($_POST['accep'])){
  if(isset(row_sqlconector2("SELECT USUARIO FROM USER WHERE USUARIO='{$_POST['api']}'")['USUARIO'])){
    if($_POST['api']==row_sqlconector2("SELECT USUARIO FROM USER WHERE USUARIO='{$_POST['api']}'")['USUARIO'] &&
    $_POST['password']==row_sqlconector2("SELECT USUARIO,PASSWORD FROM USER WHERE USUARIO='{$_POST['api']}'")['PASSWORD']){
      $ipreal = getRealIpAddr();
      sqlconector2("UPDATE USER SET IP='{$ipreal}' WHERE USUARIO='{$_POST['api']}'");
      $_SESSION['usuario'] = $_POST['api']; // Guardar el nombre del usuario en la sesión
      header("location: ./".$_POST['api']."/index?user={$_POST['api']}");
    }
    //$_SESSION['user'] = $_POST['session'];
  }
}

sqlconector2("CREATE TABLE IF NOT EXISTS USER (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  USUARIO VARCHAR(255),
  PASSWORD VARCHAR(255),
  IP VARCHAR(255),
  SALDO DECIMAL(16,4) NOT NULL DEFAULT 0.00,
  RATE INT DEFAULT 1,
  BLOQUEADO INT DEFAULT 0
)");

?>
<!DOCTYPE html>
<html>
<head>
  <title>Xbase</title>
  <link rel="shortcut icon" href="favicon.png">
  <meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <style>
  body{
    text-align:center;
    display: flex;
    justify-content: center;
    background:black;
  }
  .form{
    top: 15%;
    width: 350px;
    height: 221px;
    border: 1px solid black;
    border-radius: 13px;
    text-align: center;
    padding: 13px;
    background: #27BACD;
    position: absolute;
    box-shadow: 4px 3px 8px 1px #969696;
  }

  input[type="submit"]{
    padding: 8px;
    font-size: 13px;
    margin: 21px;
    font-weight: bold;
  }

  input[type="text"]{
    padding: 8px;
    font-size: 13px;
    width: 70%;
  }

  input[type="password"]{
    margin-top: 5px;
    padding: 8px;
    font-size: 13px;
    width: 70%;
  }
  </style>
  <script>
  function next(){
    $.post("index.php",{
      session: document.getElementById("api").value,
      password: document.getElementById("password").value
    },function(data){
      /*window.location.href="./"+document.getElementById("api").value+"/index";*/
    });
  }
  </script>
</head>
<body>
  <form class="form" action="index" method="post" autocomplete="off">
    <div >
      <h2>XBase</h2>
      Token Api <input autocomplete="off" type="text" id="api" name="api" placeholder="Input your Token" onchange="document.getElementById('accep').disabled=false">
      Passwords <input style="margin-top: 5px;" autocomplete="off" type="text" id="password" name="password" placeholder="Input your Password" onchange="document.getElementById('accep').disabled=false">
      <br>
      <input type="submit" id="accep" name="accep" disabled value="Next go" onclick="">
    </div>
  </form>
</body>
</html>
