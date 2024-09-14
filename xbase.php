<?php
include "modulo.php";

if (!isset($_SESSION['usuario'])) {
  // Si no hay sesión iniciada, redirigir al login
  header("Location: index?token=");
  exit();
}

if(getRealIpAddr() != getSession($_GET['token'])['IP']){
  echo "No se puede Iniciar sesion en dos Ip distintas...";
  exit();  
}

?>
<!DOCTYPE html>
<html style="overflow-x:hidden;overflow-y:auto;">
<head>
  <title>Help Trader</title>
  <link rel="shortcut icon" href="favicon.png">
  <meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
  <script src="javascript/block.js"></script>
  <link rel="stylesheet" href="css/style.css">
  <script src="css/SweetAlert/sweetalert2.all.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/SweetAlert/sweetalert2.min.css" /> 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.min.css">

  <style>
    .c3-axis-x text {
            fill: white; /* Cambia 'blue' por el color que prefieras */
            font-size: 12px; /* Ajusta el tamaño de la fuente si es necesario */
        }

        .c3-axis-y text {
            fill: white; /* Cambia 'red' por el color que prefieras */
            font-size: 12px; /* Ajusta el tamaño de la fuente si es necesario */
        }    
        .c3-legend-item text {
            fill: white; /* Cambia 'blue' por el color que prefieras */
        }    

        .c3-tooltip {
            background-color: #f9f9f9; /* Cambia el color de fondo del tooltip */
            border: 1px solid #ccc; /* Cambia el color del borde del tooltip */
        }

        .c3-tooltip th {
            color: blue; /* Cambia el color de la letra del encabezado del tooltip */
        }

        .c3-tooltip td {
            color: red; /* Cambia el color de la letra del contenido del tooltip */
        }        
  </style>

  <script>
  </script>
</head>
<body onload="inicio()"> 

<div id='preloader'>
  	<div class='charge_logo'>
      <div class='charge_word'>
        <div class='loader'></div>
      </div>
    </div>
  </div>

<input type="hidden" id="recordCount" value="">
<input type="hidden" id="priceMax" value="">
<input type="hidden" id="priceMin" value="">
<input type="hidden" id="recupera" value="">
<input type="hidden" id="btAgregar" value="">
<input type="hidden" id="balance" value="">
<input type="hidden" id="cantidadComprada" value='0' >
<input type="hidden" id="price" value='0' >
<input type="hidden" id="perdidas" value="0">
<input type="hidden" id="usuario" value="<?php if(isset($_SESSION['usuario'])) echo $_SESSION['usuario']; ?>">
<span style=display:none; id="techo"></span>

<dialog class="dialog_retiro" id="newAsset" close>
  <div style="display:inline-block;font-weight: bold;text-transform:capitalize;" >Nueva Criptomoneda</div>
  <a title="Cerrar" style="font-weight: bold;float:right;cursor:pointer;" onclick="document.getElementById('newAsset').close()">X</a><br>
  <hr>  
  <span>Moneda Par </span><input style="width:100px;" title="Example: HNTUSDT, HNTUSDC" type="text" maxlength="10" id="newMoneda" value=""><br>
  <span>Asset </span><input style="width:100px;" title="Asset is: HNT, BNB, BTC" type="text" maxlength="10" id="newAssetSimbol" value=""><br>  
  <span>Estable Coin </span><input style="width:100px;" title="USDT, USDC" type="text" maxlength="10" id="newEstableCoin" value=""><br>
  <button style="margin-left: 55px;background:transparent;" type="button" onclick="Reset()"><span style='font-size:24px;'>&#9088;</span>Insertar</button>  
</dialog>

<dialog class="dialog_retiro" id="config" close>
    <div style="display:inline-block;font-weight: bold;text-transform:capitalize;" >Configuracion</div>
    <a title="Cerrar" style="font-weight: bold;float:right;cursor:pointer;" onclick="document.getElementById('config').close()">X</a><br>
    <hr>
    <span>Moneda Par </span><input readonly style="width:100px;"  type="text" maxlength="10" id="moneda" value=""><span style="float:right;border:1px solid black; border-radius:3px;padding:2px; font-size:12px;cursor:default;" onclick="deletePar()">Delete</span><br>
    <span>Asset </span><input style="width:100px;"  type="text" maxlength="10" id="asset" value=""><br>
    <span>Estable Coin </span><input style="width:100px;"  type="text" maxlength="10" id="estableCoin" value=""><br>
    <span>Balance </span><input style="width:100px;" type="number" step="0.01" id="newBalance" value="0" ><br>
    <span>Capital </span><input style="width:100px;" type="number" step="0.01" id="capital" value="0" onkeyup="calculo()" onchange="calculo()"> Usd<br>    
    <span>N. Escalones </span><input style="width:30px;" type="number" min="1" max="21" step="1" id="escalones" value="" onkeyup="calculo()" onchange="calculo()"><br>
    <span>Impuesto %</span><input style="width:80px;" type="number" step="0.01" id="impuesto" value="" ><br>
    <span>Ganancia %</span><input style="width:80px;" type="number" step="1" id="precio_venta" value="" ><br>
    <span>Perdida %</span><input style="width:80px;" type="number" step="1" id="stop" value="" ><br>
    <input onclick="local()" style="margin-left: 0px;" type="checkbox" id="local"><label for="local" title="Indica si trabajas desde un seridor local XAMPP">Xampp</label>
    <input onclick="bina()" type="checkbox" id="orderBinance" ><label for="orderBinance" title="Colocar los Escalones como Ordenes en Binance">Server</label>   
    <br>
    <button style="margin-left: 55px;background:transparent;" type="button" onclick="Guardar()"><span style='font-size:24px;'>&#128190;</span>Guardar</button>
    <button type="button" onclick="cerrar_sesion()">Cerrar Sesion</button>
  </dialog>  

<div style="padding:5px;"> 
  <div class="price_entrada">
    <label style="margin-left:13px;font-size:21px;font-weight:bold;" id="priceMoneda"></label>
    <label title="Config" style="margin-left:13px;font-weight:bold;font-size:21px;" id="btnConfig" onclick="showConfig()" >&#9881;</label>
    <label style="margin-left:10px;font-size:18px;color:white;cursor:pointer;" title="Insertar una Nueva" onclick="document.getElementById('newAsset').show()">&#10010;</label>
    <input type="radio" id="xmes" name="fav_language" value="xmes" onclick="xmes()">
    <label for="xmes">MES</label>
    <input type="radio" id="xano" name="fav_language" value="xano" onclick="xano()">
    <label for="xano">ALL</label>
    <label title="Actualizar" onclick="xgraf()"><span style='margin-left:8px;color:white;cursor:pointer;font-size:18px;'>&#9851;</span></label>    
  </div>
  <div class="price_entrada">
    <label style="display:none;" id="priceBtc"></label>    
  </div>
</div>

<div class="chart">
  <div id="chart-container" class="grafico">
    <div id="chart"></div>
  </div>
</div>

<div class="div1">
  <div id="izquierda" class="izquierda" style="height:190px;">  
  <table style=width:100%;text-align:right;color:#767E8A;border-spacing:0px; >
    <tr><td></td></tr>
    <tr><td>Alerta <select style="text-transform:uppercase;font-weight: bold;border:0;outline:0;color:#EAECEF; background:#171A1E;" id="colorAlerta">
      <option value="mute" selected label="Mute &#128263;">
      <option value="un-mute" label="Alertas &#128266;">
    </select>
</td></tr>
    <tr><td><label style="color:#EAECEF;font-weight: bold;"id="utc"></label></td></tr>
    <tr><td><label title="Promedio de Precio" style="font-weight:bold;" id="zona"></label></td></tr>
    <tr><td><label style="font-weight:bold;" id="tendencia"></label></td></tr>
    <tr><td><label style="font-weight:bold;" id="totalTendencia"></label></td></tr>
    <tr><td><label style="font-weight:bold;" id="mercado"></label></td></tr>
  </table>
  </div> 

  <div id="derecha" class="derecha" style="height:190px;">    
    <table style=width:100%;text-align:right;color:#767E8A;border-spacing:0px; >
      <tr><td></td><td></td></tr>
      <tr><td><span style="font-weight:bold;cursor:pointer;font-size:16px;color:white;" title="Suma la Ganancia al Capital" onclick="sumarGanancia()">&#8721;</span><span> Capital</span></td><td><input style="background: #171A1E; color:white;font-weight:bold;margin: 0;text-align:right;" type="text" id="showCapital" value="0.00" readonly></td></tr>
      <tr><td><span style=""><span title="Reset Ganancias" style="cursor:pointer;font-size:24px; background:transparent;color:white;" onclick="resetGanancias()">&#8630;</span>Ganancias</span></td><td><input style="background: #171A1E; color:white;font-weight:bold;margin: 0;text-align:right;" type="text" id="ganancias" value="0.00" readonly ></td></tr>
      <tr><td><span style="">Disp </span></td><td><input style="margin: 0;background: #171A1E; color:white;font-weight:bold;text-align: right;" step="0.01" type="text" id="disponible" value="0.00" readonly ></td></tr>
      <tr><td><span style="">Inv x Compra</span></td><td><input style="margin: 0;background: #171A1E; color:white;font-weight:bold;text-align: right;" step="0.01" type="text" id="invxcompra" value="0.00" readonly ></td></tr>
      <tr><td><span style="">Ult. Venta</span></td><td><input style="margin: 0;background: #171A1E; color:white;font-weight:bold;text-align: right;" step="0.01" type="text" id="ultimaventa" value="0.00" readonly ></td></tr>
    </table>
  </div>

  <div id="abajo" class="abajo">    
    <label title="Nivel vela con dia anterior Bitcoin" class=stylenivel id="antbtc"></label> 
    <label title="Posibilidad de Vender" class=stylenivel id="ant"></label>  
    <label title="Min de Vela con dia anterior" class=stylenivel id="symbol" style="display:none;"></label>
    <label title="Posiblidad de Comprar" class=stylenivel id="nivelcompra"></label>
    <span style="float:right;font-weight:bold;" id="mindia"></span>
    <label id="buttonMuted" class="mute is-muted" onclick="toggleMute()" style=" display:none;margin-left:13px;font-size:21px;cursor: pointer;">&#128266;</label>
  </div>
</div>

<div class="div3" >
    <div class=bar>
      <button id="tabButtonOpera" class="bar tabButton" style="color:#F0B90B;" onclick=clickTabOpera()>Operaciones</button>
      <button id="tabButtonBinance" class="bar tabButton" onclick=clickTabBinance()>Ordenes en Binance</button>
    </div>

    <div id=tabOpera class=tabContainer>
      <div id="div3"></div>
    </div>

    <div class=tabContainer id=tabBinance style=display:none;>
      <div  id="div2"></div>
    </div>   

</div>

<div class="div2">
  <div class="izquierda_asset" id="listasset"></div>
  <div id="derecha" class="derecha" style="">
    <div class=bar>
      <button id="tabButtonComprar" class="bar tabButton" style="background:#1E2026;color:#F6465D;border-top:2px solid #F0B90B;" onclick=clickTabComprar()>Comprar</button>
      <button id="tabButtonVender" class="bar tabButton" onclick=clickTabVender()>Vender</button>
    </div>
    <div id=tabComprar class=tabContainer>
      <table style=width:100%;text-align:right;>
        <tr><td>Precio</td><td> <input style="width:100px;margin:0;padding:0px;background:#2A2E34; color:white;font-weight:bold;padding:3px;" type="number" value="0" id="precioCompra" style="width: 80px;" onkeyup="escalon()" onchange="escalon()" step="0.00000001"></td></tr>
        <tr><td>Cantidad</td><td><span style="" id="piso"></span></td></tr>
        <tr><td>StopLoss</td><td><span style="" id="stoploss"></span></td></tr>
        <tr><td></td><td><label for="sugerirPrecioCompra">Market</label><input type="checkbox" id="sugerirPrecioCompra" checked></td></tr>        
        <tr><td></td><td>.</td></tr>
        <tr><td></td><td>.</td></tr>
      </table>
      <br>
      <button class='appbtn' style="background:#F6465D;margin:0;width:100%;color:white;" type="button" onclick="agregar()">COMPRAR <span style="font-weight: bold;" id="cualmoneda"></span></button>
    </div>

    <div class=tabContainer id=tabVender style=display:none;>
      <table style=width:100%;text-align:right;>
        <tr><td>Precio</td><td> <input style="width:100px;margin:0;padding:0px;background:#2A2E34; color:white;font-weight:bold;padding:3px;" type="number" value="0" id="precioCompra2" style="width: 80px;" onkeyup="escalon()" onchange="escalon()" step="0.00000001" ></td></tr>
        <tr><td>Balance</td><td><input style="width:110px;margin: 0;background: #171A1E; color:white;font-weight:bold;text-align: right;" type="text" id="mbalance" value="0.00" readonly ></td></tr>
        <tr><td>Total</td><td><span style=width:100px;font-weight:bold;color:white; id="totalBalanceVenta">0.00USDT</span></td></tr>
        <tr><td></td><td><label for="sugerirPrecioVenta">Market</label><input type="checkbox" id="sugerirPrecioVenta" checked></td></tr>
        <tr><td></td><td>.</td></tr>
        <tr><td></td><td>.</td></tr>
      </table>
      <br>   
      <button title="Vender" type=button cclass='appbtn' style="background:#4BC883;margin:0;width:100%;color:white;" onclick=negativo()>VENDER <span style="font-weight: bold;" id="cualmoneda2"></span></button>
    </div>
  </div>  
</div>

<dialog class="dialog_retiro" id="retiro" close>
  <div style="display:inline-block;" id="iconmoney"></div>
  <a title="Cerrar" style="font-weight: bold;float:right;cursor:pointer;" onclick="document.getElementById('retiro').close()">X</a><br>
</dialog>
<br><br>
   <!-- Incluir D3.js -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js"></script>
    <!-- Incluir C3.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.min.js"></script>
</body>
</html>
<!--
color rojo: #F6465D
color verde: #4BC883 
-->
