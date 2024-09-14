<?php
//session_start();
include "modulo.php";

$token = "";
if (isset($_SESSION['usuario'])) {
  // Si hay sesión iniciada, redirigir a xbase
  header("Location: xbase?token={$_SESSION['usuario']}");
}


if(isset($_POST['accep'])){
  $tokenVerifi =  $_POST['api'];
  $passwordVerifi = $_POST['password'];
  $hashPassword = row_sqlconector("SELECT USUARIO,PASSWORD FROM USER WHERE USUARIO='$tokenVerifi'")['PASSWORD'];

  if(ifUsuarioExist($tokenVerifi)){
    if(password_verify($passwordVerifi, $hashPassword)){
      $ipreal = getRealIpAddr();
      sqlconector("UPDATE USER SET IP='{$ipreal}' WHERE USUARIO='$tokenVerifi'");
      $_SESSION['usuario'] = $tokenVerifi; // Guardar el nombre del usuario en la sesión
      header("location: xbase?token=$tokenVerifi");    
    }
  }
}

if(isset($_GET['token'])){
  $token = $_GET['token'];
  //solo te redidirige si el usuario es valido
  if(ifUsuarioExist($token)){ 
    if(!ifDatColum($token,"USER", "PASSWORD")){
      header("location: newuser?token=$token");
    }
  }
}

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

  </script>
</head>
<body>
  <form class="form" action="index" method="post" autocomplete="off">
    <div >
      <h2>XBase</h2>
      Token Api <input value="<?php echo $token; ?>" autocomplete="off" type="text" id="api" name="api" placeholder="Input your Token" onchange="document.getElementById('accep').disabled=false">
      Passwords <input style="margin-top: 5px;" autocomplete="off" type="password" id="password" name="password" placeholder="Input your Password" onchange="document.getElementById('accep').disabled=false">
      <br>
      <input type="submit" id="accep" name="accep" disabled value="Next go" onclick="">
    </div>
  </form>
</body>
</html>
