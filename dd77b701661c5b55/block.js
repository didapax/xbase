/* Javascript */
let alarMuted = 1;
let chart;
let dollarUSLocale = Intl.NumberFormat('en-IN');
let datos;

function jsNota(frecuencia){
        const context= new AudioContext();
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
  let cantidad = document.getElementById('invxcompra').value*1;
  let precio = document.getElementById('precioCompra').value*1;
  let total = cantidad / precio;
  let moneda = document.getElementById('moneda').value;
  let cantidadComprada;
  document.getElementById('cantidadComprada').value = quantity(total,moneda);
  cantidadComprada = document.getElementById('cantidadComprada').value;
  document.getElementById('piso').innerHTML = "<span style=font-weight:bold;color:white;>" + cantidadComprada +"<span style=font-weight:bold;color:gray;>"+document.getElementById('asset').value+"</span></span>";

  $.get("block?getpante=&nprice="+document.getElementById('precioCompra').value,
  function(data){ 
    datos= JSON.parse(data);
    document.getElementById('stoploss').innerHTML = "<span style=font-weight:bold;color:white;>" + datos.pante+"<span style=font-weight:bold;color:gray;>USDT</span></span>";
  });
}

function agregar(){
    if(navigator.onLine){
      let valor= "Limit";
      let t_precio = ""+priceFixed(document.getElementById('precioCompra').value);
      let simbol = document.getElementById('asset').value;
      let cantidad = document.getElementById('cantidadComprada').value;
      let moneda = document.getElementById('moneda').value;
      let mensaje =`Confirmas la Operacion Comprar ${cantidad}  ${simbol} a un Pecio ${valor} de ${t_precio} Usdc`;

      if(document.getElementById('sugerirPrecioCompra').checked === true){
        valor = "Market";
        mensaje =`Confirmas la Operacion Comprar ${cantidad}  ${simbol} a precio de  ${valor}`;
      }

      Swal.fire({
        title: `Comprar ${moneda}`,
        text: mensaje,
        icon: 'warning',
        confirmButtonColor: '#EC7063',
        confirmButtonText: 'Si Comprar',
        showCancelButton: true,
        cancelButtonText: "No Comprar"
        }).then((result) => {
            if (result.isConfirmed) {
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
                    Swal.fire({
                      title: 'xbase',
                      text: "Hubo un Error al Insertar el Escalon Intente de Nuevo.!",
                      icon: 'info',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: 'Ok'
                      });                
                  }else{ 
                    leerDatos();
                  }        
                });
              }
              else{
                Swal.fire({
                  title: 'xbase',
                  text: "No se pudo agregar la Compra.!",
                  icon: 'error',
                  confirmButtonColor: '#3085d6',
                  confirmButtonText: 'Ok'
                  });          
              }
            }
          });
    }
    else{
      Swal.fire({
        title: 'xbase',
        text: "No hay Conexion",
        icon: 'error',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'Ok'
        });
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
  Swal.fire({
    title: 'xbase',
    text: "Estas Seguro de Vender.!",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Vender',
    showCancelButton: true,
    cancelButtonText: "No estoy seguro"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{
            perdida:id
          },function(data){
            leerDatos();
          });        
        }
      });
}

function deletePar(){
  Swal.fire({
    title: 'xbase',
    text: "Estas Seguro de Eliminar a "+document.getElementById('moneda').value+"...?",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Eliminar',
    showCancelButton: true,
    cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{
            deletepar: document.getElementById('moneda').value
          },function(data){
            window.location.href="../index";
          });
        }
    });
}

function negativo(){
  let valor= "Limit";
  let precio = document.getElementById('precioCompra2').value *1;
  let moneda = document.getElementById('moneda').value;
  let cantidad = document.getElementById('balance').value*1;

  if(document.getElementById('sugerirPrecioVenta').checked === true){
    valor = "Market";
  }  
  Swal.fire({
    title: 'xbase',
    text: "Estas Seguro de Vender "+document.getElementById('mbalance').value+" .?",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Vender',
    showCancelButton: true,
    cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{              
            negativo: 1,
            tipo: valor,
            cantidad: cantidad,
            precio: precio,
            moneda: moneda
          },function(data){
            leerDatos();
          });
        }
      });
}

function negativoBuy(id){
  Swal.fire({
    title: 'Retirar',
    text: "Estas Seguro de Liquidar tu posicion..?",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Liquidar',
    showCancelButton: true,
    cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{
            negativoBuy: 0,
            negativo: id
        },function(data){
            if(data.includes("error")){
                //alert(data);
            }
            leerDatos();
        });
        }
      });
}

function borrar(id){
  Swal.fire({
    title: 'xbase',
    text: "Estas Seguro de Eliminar el escalon con sus Ordenes.?",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Eliminar',
    showCancelButton: true,
    cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{
            borrar: id
          },function(data){
            leerDatos();
          });
        }
    });
}

function autosell(id){
  Swal.fire({
    title: 'xbase',
    text: "Confirma que quieres activar el Auto Sell.? se vendera a precio de mercado",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Activar',
    showCancelButton: true,
    cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{
            autosell: id
          },function(data){
            refreshDatos();
          });
        }
    });
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
    Swal.fire({
      title: 'xbase',
      text: "Debe existir una Moneda, serciorate que la escribiste bien..!",
      icon: 'error',
      confirmButtonColor: '#3085d6',
      confirmButtonText: 'Ok'
      });    
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
  return valor;
}

function formatPrice(valor,moneda){
  switch (moneda) {
    case "TRXUSDT":
    case "DOGEUSDT":        
        return (valor *1).toFixed(5);
        break;     
    case "ADAUSDT":
    case "MATICUSDT":
        return (valor *1).toFixed(4);
        break;             
    case "RUNEUSDT":
    case "ATOMUSDT":
    case "NEARUSDT":
    case "INJUSDT":
        return (valor *1).toFixed(3);
        break;  
    case "BTCUSDT":
    case "ETHUSDT":
    case "LTCUSDT":      
        return (valor *1).toFixed(2);
        break;      
    case "BNBUSDT":
        return (valor *1).toFixed(1);
        break;
    case "PAXGUSDT":
        return (valor *1).toFixed(0);
        break;   
    default:
      return valor *1;
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
    case "SHIBUSDC":
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

      if(document.getElementById('sugerirPrecioVenta').checked === true){
        document.getElementById('precioCompra2').value = formatPrice(datos.price,datos.moneda);
      }      
      document.title = datos.asset+" "+datos.labelpricemoneda; 
      document.getElementById('priceMoneda').innerHTML = "<span style='margin-right:5px;color:white;'>"+datos.asset+"</span> "+datos.labelpricemoneda;
      document.getElementById('price').value = formatPrice(datos.price,datos.moneda);
      document.getElementById('priceBtc').innerHTML = "<span style='margin-right:5px;color:white;'>BTC</span> "+datos.labelpricebitcoin;
      document.getElementById('tendencia').innerHTML = "Dia "+datos.tendencia;
      document.getElementById('totalTendencia').innerHTML = "Tendencia "+datos.totalTendencia;
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
    Swal.fire({
      title: 'xbase',
      text: "No hay ganancias que sumar!",
      icon: 'info',
      confirmButtonColor: '#3085d6',
      confirmButtonText: 'Ok'
      });      
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
