var context= new AudioContext();
var alarMuted = 1;
let chart;
let dollarUSLocale = Intl.NumberFormat('en-IN');
let datos;

function jsNota(frecuencia){
        var o= context.createOscillator();
        g=context.createGain();
        o.connect(g);
        o.type="sawtooth";
        o.frequency.value=frecuencia;
        g.connect(context.destination);
        o.start(0);
        g.gain.exponentialRampToValueAtTime(0.00001,context.currentTime +1.5);
}

function Guardar(){
  document.getElementById("preloader").style.display='block';
  $.post("block",{
    guardar: "",
    invxcompra: (document.getElementById('invxcompra').value *1).toFixed(2),
    moneda: document.getElementById('moneda').value,
    asset: document.getElementById('asset').value,
    capital: document.getElementById('capital').value,
    escalones: document.getElementById('escalones').value,
    disponible: document.getElementById('disponible').value,
    impuesto: document.getElementById('impuesto').value,
    precio_venta: document.getElementById('precio_venta').value,
    stop: document.getElementById('stop').value
  },function(data){
    document.getElementById('config').close();
    leerDatos();
    document.getElementById("preloader").style.display='none';
  });
}

function calculo(){
  document.getElementById('invxcompra').value = (document.getElementById('capital').value / document.getElementById('escalones').value).toFixed(0);
}

function escalon(){
  document.getElementById('cantidadComprada').value = quantity((document.getElementById('invxcompra').value / document.getElementById('precioCompra').value),document.getElementById('moneda').value);
  document.getElementById('piso').innerHTML = "<span style=font-weight:bold;color:white;>" + document.getElementById('cantidadComprada').value+"<span style=font-weight:bold;color:gray;>"+document.getElementById('asset').value+"</span></span>";

  $.get("block?getpante=&nprice="+document.getElementById('precioCompra').value,
  function(data){ 
    datos= JSON.parse(data);
    document.getElementById('stoploss').innerHTML = "<span style=font-weight:bold;color:white;>" + datos.pante+"<span style=font-weight:bold;color:gray;>USDT</span></span>";
  });
}

function agregar(){
    if(navigator.onLine){
      var valor= "Limit";
      var t_precio = ""+priceFixed(document.getElementById('precioCompra').value);
      if(document.getElementById('sugerirPrecioCompra').checked === true){
        valor = "Market";
        t_precio = "";
      }
      var r = confirm("Confirma Va a Comprar "+ document.getElementById('cantidadComprada').value +" Moneda Par "+document.getElementById('moneda').value+" a un Pecio "+valor+" "+t_precio);
      if (r == true) {
        if(document.getElementById("btAgregar").value === "0"){
          $.post("block",{
            agregar:"" ,
            tipo: valor,
            moneda: document.getElementById('moneda').value,
            compra: document.getElementById('invxcompra').value,
            cantidad: document.getElementById('cantidadComprada').value,
            preciocompra: document.getElementById('precioCompra').value
          },function(data){
            if(data == "error: 0001"){
              alert("Hubo un Error al Insertar el Escalon Intente de Nuevo.");
            }else{ 
              leerDatos();
            }        
          });
        }
        else{
          alert("No se puede Agregar la Compra..!");
        }
      }
      else {
        /*txt = "You pressed Cancel!";*/
      }
    }
    else{
      alert("No hay Conexion...");
    }
}

function crear(){
  $.post("block",{
    crear: ""
  },function(data){
    $("#apikey").html("ApiKey: " + data);
  });
}

function perdida(id){
  var r = confirm("Estas Seguro de Vender.!");
    if (r == true) {
      $.post("block",{
        perdida:id
      },function(data){
        leerDatos();
      });
    }
    else {
      /*txt = "You pressed Cancel!";*/
    }
}

function deletePar(){
  var r = confirm("Estas Seguro de Eliminar a "+document.getElementById('moneda').value+"...?");
    if (r == true) {
      $.post("block",{
        deletepar: document.getElementById('moneda').value
      },function(data){
        window.location.href="../index";
      });
    }
    else {
      /*txt = "You pressed Cancel!";*/
    }
}

function negativo(){
  var r = confirm("Estas Seguro de Tomar Prestado "+document.getElementById('mbalance').value+" .?");
    if (r == true) {
      let totalVenta = document.getElementById('balance').value * document.getElementById('price').value;
      if(totalVenta >20){
            $.post("block",{
              negativo: 0,
              cantidad: document.getElementById('balance').value,
              moneda: document.getElementById('moneda').value
            },function(data){
              leerDatos();
            });
      }else{
        alert("Prestamos mayor de 20$..!");
      }
    }
    else {
      /*txt = "You pressed Cancel!";*/
    }
}

function negativoBuy(id){
    var r = confirm("Estas Seguro de Pagar el Prestamo..?");
    if (r == true) {
        $.post("block",{
            negativoBuy: 0,
            negativo: id
        },function(data){
            if(data.includes("error")){
                alert(data);
            }
            leerDatos();
        });
    }
    else {
      /*txt = "You pressed Cancel!";*/
    }
}

function borrar(id){
  var r = confirm("Estas Seguro de Eliminar el escalon con sus Ordenes.?");
    if (r == true) {
      $.post("block",{
        borrar: id
      },function(data){
        leerDatos();
        /*window.location.href="index";*/
      });
    }
    else {
      /*txt = "You pressed Cancel!";*/
    }
}

function autosell(id){
  var r = confirm("Confirma Auto Sell.?");
    if (r == true) {
      $.post("block",{
        autosell: id
      },function(data){
        refreshDatos();
        /*window.location.href="index";*/
      });
    }
    else {
      /*txt = "You pressed Cancel!";*/
    }
}

function Reset(){
    let moneda = prompt("Insertar la Moneda/Par:", "");
    if (moneda.length > 0) {
      $.post("block",{
        reset:"",
        moneda: moneda.toUpperCase()
      },function(data){
        window.location.href="../index";
      });
    }
    else{
    alert("Debe Existir una Moneda..!")
    }
}

function moneyChangue(valor){
  document.getElementById("preloader").style.display='block';
  $.post("block",{ 
    changue:"",    
    moneda: valor
  },function(data){
    document.getElementById('sugerirPrecioCompra').checked = true;
    leerDatos();
    refreshDatos();
    document.getElementById("preloader").style.display='none';
  });
}

function local(){
  var valor= 0;
  if(document.getElementById('local').checked === true){
    valor = 1;
  }
  $.post("block",{
    local: valor
  },function(data){
    leerDatos();
  });
}

function xmes(){
  var valor= 0;
  $.post("block",{
    xgraf: valor
  },function(data){
    leerDatos();
  });
}

function xano(){
  var valor= 1;
  $.post("block",{
    xgraf: valor
  },function(data){
    leerDatos();
  });
}

function bina(){
  var valor= 0;
  if(document.getElementById('orderBinance').checked === true){
    valor = 1;
  }
  $.post("block",{
    bina: valor
  },function(data){
    leerDatos();
  });
}

function alertas(data){
    if(data === "verde"){
        if(document.getElementById("colorAlerta").value=="verde"){
          jsNota(184.997);
        }
    }
    else if (data === "naranja") {
        if(document.getElementById("colorAlerta").value=="naranja"){
          jsNota(233.082);
        }
    }
    else if (data === "roja") {
        if(document.getElementById("colorAlerta").value=="roja"){
          jsNota(329.628);
        }
    }
}

function priceFixed(valor){
  if((valor *1) > 1){
    return (valor *1).toFixed(2);
  }else{
    return (valor *1).toFixed(4);
  }
}

function formatPrice(valor,moneda){
  switch (moneda) {
    case "RUNEUSDT":
    case "ATOMUSDT":
    case "NEARUSDT":
    case "INJUSDT":
        return (valor *1).toFixed(3);
        break;
    case "ADAUSDT":
    case "MATICUSDT":
        return (valor *1).toFixed(4);
        break;    
    case "TRXUSDT":
    case "DOGEUSDT":        
        return (valor *1).toFixed(5);
        break;        
    case "BNBUSDT":
        return (valor *1).toFixed(1);
        break;
    case "PAXGUSDT":
        return (valor *1).toFixed(0);
        break;        
    default:
      return (valor *1).toFixed(2);
  }
}

function  quantity(valor,moneda){
  switch (moneda) {
    case "BTCUSDT":
        return (valor *1).toFixed(5);
        break;
    case "ETHUSDT":
    case "PAXGUSDT":        
        return (valor *1).toFixed(4);
        break;        
    case "BNBUSDT":
    case "LTCUSDT":
        return (valor *1).toFixed(3);
        break;
    case "MATICUSDT":
    case "TRXUSDT":
    case "RUNEUSDT":        
    case "ADAUSDT":
    case "NEARUSDT":
    case "INJUSDT":
        return (valor *1).toFixed(1);
        break;        
    case "DOGEUSDT":
        return (valor *1).toFixed(0);
        break;
    default:
      return (valor *1).toFixed(2);
  }
}

function leerDatos(){
  $.get("block?getPriceBinance=",
    function(data){      
      datos= JSON.parse(data);
      
      document.getElementById('moneda').value = datos.moneda;
      document.getElementById('asset').value = datos.asset;
      document.getElementById('capital').value = priceFixed(datos.capital);
      document.getElementById('showCapital').value = priceFixed(datos.capital);
      document.getElementById('escalones').value = (datos.escalones *1).toFixed(0);      
      document.getElementById('impuesto').value = datos.impuesto;
      document.getElementById('local').checked = (datos.auto *1);
      document.getElementById('orderBinance').checked = (datos.bina *1);
      document.getElementById('ganancias').value = priceFixed(datos.ganancia - datos.perdida);
      document.getElementById('precio_venta').value = datos.precio_venta;
      document.getElementById('stop').value = datos.stop;
      $("#div3").html(datos.verescalones);
      $("#div2").html(datos.verbinance);
      
      chart = c3.generate({
        data: {
            columns: [
                datos.grafico[0],
                datos.grafico[1]
            ],
            colors: {
              Min: '#EA465C',
              Max: '#4DCB85'
            },
            types: {
                Min: 'spline',
                Max: 'spline'
            }
          },
          point: {
            show: false
        },
          bar: {
              width: {
                  ratio: 0.5 
              }
          },
          legend: {
              show: false
          }
        });
        
      chart = null;      
      datos = null;
    });
}

function refreshDatos(){
  if(navigator.onLine){
    $.get("block?getPriceBinance&auto=", function(data){
      datos= JSON.parse(data);

      if(document.getElementById('sugerirPrecioCompra').checked === true){
        document.getElementById('precioCompra').value = formatPrice(datos.price,datos.moneda);
      }

      document.getElementById('precioCompra2').value = formatPrice(datos.price,datos.moneda);
      document.title = datos.asset+" "+datos.labelpricemoneda; 
      document.getElementById('priceMoneda').innerHTML = "<span style='margin-right:5px;color:white;'>"+datos.asset+"</span> "+datos.labelpricemoneda;
      document.getElementById('price').value = formatPrice(datos.price,datos.moneda);
      document.getElementById('priceBtc').innerHTML = "<span style='margin-right:5px;color:white;'>BTC</span> "+datos.labelpricebitcoin;
      document.getElementById('tendencia').innerHTML = "Dia "+datos.tendencia;
      document.getElementById('totalTendencia').innerHTML = "Tendencia "+datos.totalTendencia;
      /*document.getElementById('resistencia').innerHTML = "Resistencia <span style='color:white;'>"+datos.resistencia+"</span>";     */
      document.getElementById('zona').innerHTML = "Promedio <span style='color:white;'> "+dollarUSLocale.format(priceFixed(datos.totalpromedio))+"</span>";
      document.getElementById('utc').innerHTML = "<span style=color:#858E9B>Hora Utc </span>"+datos.utc;
      document.getElementById('ant').innerHTML = datos.nivel;
      document.getElementById('antbtc').innerHTML = datos.nivelbtc;
      document.getElementById('symbol').innerHTML = datos.symbol;
      document.getElementById('nivelcompra').innerHTML = datos.nivelcompra;
      document.getElementById('ganancias').value = priceFixed(datos.ganancia - datos.perdida);
      document.getElementById('priceMax').value = priceFixed(datos.maxdia);
      document.getElementById('mindia').innerHTML ="<span style='font-size:12px;color:white;'>L "+formatPrice(datos.mindia,datos.moneda)+"</span> <div style='vertical-align: middle;display:inline-block;height:4px;width:55px;background:#E8DCDC;overflow:hidden;'><div style='background:grey;height:4px;width:"+datos.porcenmax+";'></div></div> <span style='font-size:12px;color:white;'>"+formatPrice(datos.maxdia,datos.moneda)+" H</span>";
      document.getElementById('priceMin').value = priceFixed(datos.mindia);
      document.getElementById('disponible').value = priceFixed(datos.xdisponible);
      document.getElementById('invxcompra').value = (datos.invxcompra *1).toFixed(2);
      document.getElementById('ultimaventa').value = formatPrice(datos.ultimaventa,datos.moneda);
      document.getElementById('mbalance').value = priceFixed(datos.balance)+datos.asset;      
      document.getElementById('balance').value = priceFixed(datos.balance);
      document.getElementById('perdidas').value = priceFixed(datos.perdida);
      document.getElementById('recordCount').value = datos.recordCount;
      document.getElementById('recupera').value = priceFixed(datos.recupera);
      document.getElementById('totalBalanceVenta').innerHTML = priceFixed(datos.balance * datos.price)+"USDT";
      document.getElementById('cualmoneda').innerHTML = datos.asset;
      document.getElementById('cualmoneda2').innerHTML = datos.asset;
      
      if((document.getElementById('disponible').value *1) < (document.getElementById('invxcompra').value *1)){
        document.getElementById("btAgregar").value = "1"; 
      }
      else{
        document.getElementById("btAgregar").value = "0";
      }      
      
      $("#priceMoneda").css("color",datos.color);
      $("#priceBtc").css("color",datos.colorbtc);
      $("#disponible").css("color",datos.colordisp);
      $("#div3").html(datos.verescalones);
      $("#div2").html(datos.verbinance);
      $("#listasset").html(datos.listasset);

      alertas(datos.alert);

      datos= null;
    });

    document.getElementById('techo').innerHTML = "Ganancia ≈ 0.00";
    document.getElementById('piso').innerHTML = "0.00";
    escalon();    
  }
}

function inicio(){
    leerDatos();
    refreshDatos();
    const myVar = setInterval(myTimer, 2000);
}

function myTimer() {
  refreshDatos();
}

function toggleMute(){
  if ($('#buttonMuted').hasClass('mute is-muted')){
      $('#buttonMuted').addClass('mute');
      $('#buttonMuted').removeClass('mute is-muted');
      alarMuted = 0;
    }else {
      $('#buttonMuted').removeClass('mute');
      $('#buttonMuted').addClass('mute is-muted');
      alarMuted = 1;
    }
}

function resetPerdidas(){ 
  $.get("block.php?resetPerdidas",function(data){
    leerDatos();
  })
}

function resetGanancias(){
  $.get("block.php?resetGanancias",function(data){
    document.getElementById("ganancias").value = "0.00";
    leerDatos();
  })
}

function showConfig(){
  document.getElementById('config').show();
}

function sumarGanancia(){
  if((document.getElementById('ganancias').value *1) > 0){
    var tcapital = document.getElementById('capital').value *1;
    document.getElementById('capital').value = tcapital + (document.getElementById('ganancias').value *1);
    calculo();      
    resetGanancias();
    Guardar();
  }else{
    alert("No hay ganancias que sumar");
  }
}

function clickTabComprar(){
  $("#tabComprar").css("display","block");
  $("#tabButtonComprar").css("color","#4BC883");
  $("#tabButtonComprar").css("border-top","2px solid #F0B90B");
  $("#tabButtonComprar").css("background","#1E2026");
  $("#tabVender").css("display","none");
  $("#tabButtonVender").css("color","#6B7480");
  $("#tabButtonVender").css("border-top","0");
  $("#tabButtonVender").css("background","#171A1E");

}

function clickTabVender(){
  $("#tabComprar").css("display","none");
  $("#tabButtonComprar").css("color","#6B7480");
  $("#tabButtonComprar").css("border-top","0");  
  $("#tabButtonComprar").css("background","#171A1E");
  $("#tabVender").css("display","block");
  $("#tabButtonVender").css("color","#F6465D");
  $("#tabButtonVender").css("border-top","2px solid #F0B90B");
  $("#tabButtonVender").css("background","#1E2026");
}

function clickTabOpera(){
  $("#tabOpera").css("display","block");
  $("#tabButtonOpera").css("color","#F0B90B");
  $("#tabBinance").css("display","none");
  $("#tabButtonBinance").css("color","#6B7480");
  $("#tabButtonBinance").css("border-top","0");

}

function clickTabBinance(){
  $("#tabOpera").css("display","none");
  $("#tabButtonOpera").css("color","#6B7480");
  $("#tabButtonOpera").css("border-top","0");
  $("#tabBinance").css("display","block");
  $("#tabButtonBinance").css("color","#F0B90B");
} 
