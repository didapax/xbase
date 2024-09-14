<?php
//session_start();
include "modulo.php";

$token = "";
$error_password="";

if(isset($_GET['token'])){
  $token = $_GET['token'];
}

if (isset($_SESSION['usuario'])) {
  // Si hay sesión iniciada, redirigir a xbase
  header("Location: xbase?token={$_SESSION['usuario']}");
}

if(isset($_POST['accep'])){
  $newpassword = $_POST['newpassword'];
  $repeatpassword = $_POST['repeatpassword'];
  $apiKey = $_POST['api'];
  $secret = $_POST['secret'];

  if($newpassword != $repeatpassword){
    $error_password = "Password no Coinciden...";
  }else{
    $hashContrasena = password_hash($newpassword, PASSWORD_BCRYPT);
    $encryptedApiKey = encryptApiKey($apiKey, $GLOBALS['encryptionKey']);
    $encryptedSecret = encryptApiKey($secret, $GLOBALS['encryptionKey']);
    sqlconector("UPDATE USER SET PASSWORD = '$hashContrasena' WHERE USUARIO='$token'");
    sqlconector("UPDATE PARAMETROS SET APIKEY='$encryptedApiKey', SECRET='$encryptedSecret' WHERE USUARIO='$token'");
    
    header("location: index?token=$token");
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
    height: 430px;
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
    function confirmarEnvio() {
            return confirm('¿Estás seguro de que deseas enviar estos Datos?');
    }
  </script>
</head>
<body>
  <form class="form" action="newuser?token=<?php echo $token;?>" method="post" autocomplete="off" onsubmit="return confirmarEnvio();">
    <div >
      <h3>XBase - Nuevos Usuarios</h3>
      <table style="width:100%;">
      <tr>
      <td>Token: </td><td><input readonly value="<?php echo $token; ?>" autocomplete="off" type="text" id="api" name="api" placeholder="Input your Token" ></td>
      </tr><tr>
      <td>Password: </td><td><input required style="margin-top: 5px;" autocomplete="off" type="password" id="newpassword" name="newpassword" placeholder="Input your Password" ></td>
      </tr><tr>
      <td>Repeat:</td><td> <input required style="margin-top: 5px;" autocomplete="off" type="password" id="repeatpassword" name="repeatpassword" placeholder="Repeat your Password" ></td>
      <tr>
      <td></td><td><span style="color:red;"><?php echo $error_password; ?></span></td>
      </tr>
      </table>
      <h4>Configure Api Binance</h4>
      <table style="width:100%;">
      <tr>
      <td>ApiKey: </td><td><input required style="margin-top: 5px;"  type="text" id="api" name="api" placeholder="Input your API Binance" onchange="document.getElementById('accep').disabled=false"></td>
      </tr><tr>
      <td>Secret: </td><td><input required style="margin-top: 5px;"  type="text" id="secret" name="secret" placeholder="Input your Secret API" onchange="document.getElementById('accep').disabled=false"></td>
      </tr>
      </table>
      <input type="submit" id="accep" name="accep" disabled value="Save go" onclick="">

    </div>
  </form>
</body>
</html>
