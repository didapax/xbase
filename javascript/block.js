/* Javascript */
let alarMuted = 1;
let chart;
let dollarUSLocale = Intl.NumberFormat('en-IN');
let datos;
let fiat;
let simbolo;

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
  $.post("../block",{
    guardar: "",
    invxcompra: (document.getElementById('invxcompra').value *1).toFixed(2),
    moneda: document.getElementById('moneda').value,
    asset: document.getElementById('asset').value,
    par: document.getElementById('estableCoin').value,
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
  let cantidadComprada = quantity(total,simbolo,fiat);
  document.getElementById('cantidadComprada').value = cantidadComprada;
  document.getElementById('piso').innerHTML = `<span style=font-weight:bold;color:white;>${cantidadComprada}<span style=font-weight:bold;color:gray;>${simbolo}</span></span>`;

  $.get("../block?getpante=&nprice="+document.getElementById('precioCompra').value,
  function(data){ 
    datos= JSON.parse(data);
    document.getElementById('stoploss').innerHTML = `<span style=font-weight:bold;color:white;>${datos.pante}<span style=font-weight:bold;color:gray;>${fiat}</span></span>`;
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
                $.post("../block",{
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
  $.post("../block",{
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
          $.post("../block",{
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
          $.post("../block",{
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
          $.post("../block",{              
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
          $.post("../block",{
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
          $.post("../block",{
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
          $.post("../block",{
            autosell: id
          },function(data){
            refreshDatos();
          });
        }
    });
}

function Reset(){
  let moneda = document.getElementById('newMoneda');
  let asset = document.getElementById('newAssetSimbol');
  let par = document.getElementById('newEstableCoin');

  let monedaValue = moneda.value;
  let assetValue = asset.value;
  let parValue = par.value;

  if(monedaValue && assetValue && parValue){
    Swal.fire({
      title: "xbase",
      text: `insertando la Moneda con su Par ${monedaValue}, esta Usted Seguro?`,
      icon: 'warning',
      confirmButtonColor: '#EC7063',
      confirmButtonText: 'Si Insertar',
      showCancelButton: true,
      cancelButtonText: "Cancelar"
      }).then((result) => {
          if (result.isConfirmed) {
            $.post("../block",{
              reset:"",
              moneda: monedaValue.toUpperCase(),
              asset: assetValue.toUpperCase(),
              par: parValue.toUpperCase()
            },function(data){
              window.location.href="../index";
            });
          }
        });
  }
  else{
    Swal.fire({
      title: 'xbase',
      text: "Faltan Datos, una o mas variables estan vacias llena el formulario bien..!",
      icon: 'error',
      confirmButtonColor: '#3085d6',
      confirmButtonText: 'Ok'
      });    
  }
}

function moneyChangue(valor){
  document.getElementById("preloader").style.display='block';
  $.post("../block",{ 
    changue:"",    
    moneda: valor
  },function(data){
    document.getElementById('sugerirPrecioCompra').checked = true;
    refreshDatos();
    leerDatos();
    document.getElementById("preloader").style.display='none';
  });
}

function local(){
  var valor= 0;
  if(document.getElementById('local').checked === true){
    valor = 1;
  }
  $.post("../block",{
    local: valor
  },function(data){
    leerDatos();
  });
}

function xmes(){
  var valor= 0;
  $.post("../block",{
    xgraf: valor
  },function(data){
    leerDatos();
  });
}

function xano(){
  var valor= 1;
  $.post("../block",{
    xgraf: valor
  },function(data){
    leerDatos();
  });
}

function xgraf(){
  leerDatos();
}

function bina(){
  var valor= 0;
  if(document.getElementById('orderBinance').checked === true){
    valor = 1;
  }
  $.post("../block",{
    bina: valor
  },function(data){
    leerDatos();
  });
}

function alertas(data){
  let muted = document.getElementById("colorAlerta").value;
    if(data === "green" && muted == "un-mute"){
          jsNota(184.997);
    }
    else if (data === "yellow" && muted == "un-mute") {
          jsNota(329.628);
    }
    /*else if (data === "orange" && muted == "un-mute") {
      jsNota(233.082);
    }*/
}

function priceFixed(valor){
  return valor;
}

function  quantity(valor,simbolo,par){
  if(par === "USDT" || par === "USDC"){
    switch (simbolo) {
      case "BTC":
          return (valor *1).toFixed(5);
      case "ETH":
      case "PAXG":        
          return (valor *1).toFixed(4);
      case "BNB":
      case "LTC":
          return (valor *1).toFixed(3);
      case "MATIC":
      case "TRX":
      case "RUNE":        
      case "ADA":
      case "NEAR":
      case "INJ":
          return (valor *1).toFixed(1);
      case "DOGE":
      case "SHIB":
          return (valor *1).toFixed(0);
      default:
        return (valor *1).toFixed(2);
    }
  }else{
    return (valor *1).toFixed(2);
  }
}

function leerDatos() {
  $.get("../block?getPriceBinance=", function(data) {
      datos = JSON.parse(data);
      
      document.getElementById('moneda').value = datos.moneda;
      document.getElementById('asset').value = datos.asset;
      document.getElementById('capital').value = priceFixed(datos.capital);
      document.getElementById('showCapital').value = priceFixed(datos.capital);
      document.getElementById('escalones').value = (datos.escalones * 1).toFixed(0);
      document.getElementById('impuesto').value = (datos.impuesto * 1);
      document.getElementById('local').checked = (datos.auto * 1).toFixed(2);
      document.getElementById('orderBinance').checked = (datos.bina * 1);
      document.getElementById('ganancias').value = priceFixed(datos.ganancia - datos.perdida);
      document.getElementById('precio_venta').value = datos.precio_venta;
      document.getElementById('stop').value = datos.stop;
      document.getElementById('newBalance').value = datos.balance_asset;
      document.getElementById('estableCoin').value = datos.par;
      $("#div3").html(datos.verescalones);
      $("#div2").html(datos.verbinance);
      fiat = datos.par;
      simbolo = datos.asset;
      
      const graf = datos.grafico;

      // Crear el gráfico con C3.js
      var chart = c3.generate({
          bindto: '#chart', // Asegúrate de que el contenedor del gráfico esté definido en tu HTML
          size: {
            width: document.getElementById('chart-container').offsetWidth,
            height: document.getElementById('chart-container').offsetHeight
        },          
          data: {
            json: graf,
            keys: {
              x: 'date',
              value: ['high', 'low','prm'],
            },
            colors: {
              low: '#EA465C',
              high: '#4DCB85',
              prm: '#f6f646'
          },
              types: {
                  high: 'spline',
                  low: 'spline',
                  prm: 'spline'
              }
          },
          axis: {
              x: {
                  type: 'timeseries',
                  tick: {
                      format: '%d-%m' // Formato de fecha
                  }
              },
              y: {
                  tick: {
                      //format: d3.format('.8f')  Formato de número con 8 decimales
                  }
              }
          },
          point: {
              show: false 
          },
          legend: {
              show: true
          },
          onrendered: function() {
            d3.selectAll("svg > .bgRect").remove();
            d3.selectAll("svg").insert("rect", ":first-child")
                .attr("class", "bgRect")
                .attr("width", "100%")
                .attr("height", "100%")
                .attr("fill", "#161A1E"); // Cambia 'lightgray' por el color que prefieras
        }          
      });

        // Redimensionar el gráfico cuando la ventana cambie de tamaño
        window.addEventListener('resize', function() {
          chart.resize({
              width: document.getElementById('chart-container').offsetWidth,
              height: document.getElementById('chart-container').offsetHeight
          });
      });
  });
}

function refreshDatos(){
  if(navigator.onLine){
    $.get("../block?getPriceBinance&auto=", function(data){
      datos= JSON.parse(data);

      if(document.getElementById('sugerirPrecioCompra').checked === true){
        document.getElementById('precioCompra').value = datos.price;
      }

      if(document.getElementById('sugerirPrecioVenta').checked === true){
        document.getElementById('precioCompra2').value = datos.price;
      }      
      document.title = datos.asset+" "+datos.labelpricemoneda; 
      document.getElementById('priceMoneda').innerHTML = "<span style='margin-right:5px;color:white;'>"+datos.asset+"</span> "+datos.labelpricemoneda;
      document.getElementById('price').value = datos.price;
      document.getElementById('priceBtc').innerHTML = "<span style='margin-right:5px;color:white;'>BTC</span> "+datos.labelpricebitcoin;
      document.getElementById('tendencia').innerHTML = `Dia ${datos.asset} ${datos.tendencia}`;
      document.getElementById('totalTendencia').innerHTML = `Tendencia ${datos.asset} ${datos.totalTendencia}`;
      document.getElementById('mercado').innerHTML = "Mercado "+datos.mercado;
      document.getElementById('zona').innerHTML = "Promedio <span style='color:white;'> "+dollarUSLocale.format(priceFixed(datos.totalpromedio))+"</span>";
      document.getElementById('utc').innerHTML = "<span style=color:#858E9B>Hora Utc </span>"+datos.utc;
      document.getElementById('ant').innerHTML = datos.nivel;
      document.getElementById('antbtc').innerHTML = datos.nivelbtc;
      document.getElementById('symbol').innerHTML = datos.symbol;
      document.getElementById('nivelcompra').innerHTML = datos.nivelcompra;
      document.getElementById('ganancias').value = priceFixed(datos.ganancia - datos.perdida);
      document.getElementById('priceMax').value = priceFixed(datos.maxdia);
      document.getElementById('mindia').innerHTML =`<span style='font-size:12px;color:white;'>L ${datos.mindia}</span> <div style='vertical-align: middle;display:inline-block;height:4px;width:55px;background:#E8DCDC;overflow:hidden;'><div style='background:grey;height:4px;width:${datos.porcenmax};'></div></div> <span style='font-size:12px;color:white;'>${datos.maxdia} H</span>`;
      document.getElementById('priceMin').value = priceFixed(datos.mindia);
      document.getElementById('disponible').value = priceFixed(datos.xdisponible);
      document.getElementById('invxcompra').value = (datos.invxcompra *1).toFixed(2);
      document.getElementById('ultimaventa').value = datos.ultimaventa;
      document.getElementById('mbalance').value = priceFixed(datos.balance)+datos.asset;      
      document.getElementById('balance').value = priceFixed(datos.balance);
      document.getElementById('perdidas').value = priceFixed(datos.perdida);
      document.getElementById('recordCount').value = datos.recordCount;
      document.getElementById('recupera').value = priceFixed(datos.recupera);
      let resultado = datos.balance * datos.price;
      document.getElementById('totalBalanceVenta').innerHTML = resultado.toFixed(2) +fiat;
      document.getElementById('cualmoneda').innerHTML = datos.asset;
      document.getElementById('cualmoneda2').innerHTML = datos.asset; 
      document.getElementById('xmes').checked = datos.checkMesGrafico;
      document.getElementById('xano').checked = datos.checkAnoGrafico;
      
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
  $.get("../block?resetPerdidas",function(data){
    leerDatos();
  })
}

function resetGanancias(){
  $.get("../block?resetGanancias",function(data){
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
  $("#tabButtonComprar").css("color","#F6465D");
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
  $("#tabButtonVender").css("color","#4BC883");
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

function cerrar_sesion(){
  $.get("../block?cerrarSesion",function(data){
    window.location.href="../index";
  })  
}
