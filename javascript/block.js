/* Javascript */

var alarMuted = 1;
var chart;
var dollarUSLocale = Intl.NumberFormat('en-IN');
var datos;
var fiat;
var simbolo;
var listMonedas = [];

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
  const usuario = document.getElementById('usuario').value;
  document.getElementById("preloader").style.display='block';
  $.post("block",{
    guardar: "",
    usuario: usuario,
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
    window.location.href="xbase?token="+usuario;
  });
}

function calculo(){
  document.getElementById('invxcompra').value = (document.getElementById('capital').value / document.getElementById('escalones').value).toFixed(0);
}

function escalon(){
  let cantidad = document.getElementById('invxcompra').value*1;
  let precio = document.getElementById('precioCompra').value*1;
  let total = cantidad / precio;
  let cantidadComprada = total.toFixed(8);
  document.getElementById('cantidadComprada').value = cantidadComprada;
  document.getElementById('piso').innerHTML = `<span style=font-weight:bold;color:white;>${cantidadComprada}<span style=font-weight:bold;color:gray;>${simbolo}</span></span>`;
  document.getElementById('stoploss').innerHTML = `<span style=font-weight:bold;color:white;>${datos.pante}<span style=font-weight:bold;color:gray;>${fiat}</span></span>`;
}

function agregar(){
    if(navigator.onLine){
      let valor= "Limit";
      const usuario = document.getElementById('usuario').value;
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
                  usuario: usuario,
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
                  }        
                });
              }
              else{
                Swal.fire({
                  title: 'xbase',
                  text: `La minima compra debe ser de 10 ${fiat} Fondos insuficientes `,
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
  const usuario = document.getElementById('usuario').value;
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
            perdida:id,
            usuario: usuario
          },function(data){});        
        }
      });
}

function deletePar(){
  const usuario = document.getElementById('usuario').value;
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
          document.getElementById("preloader").style.display='block';
          $.post("block",{
            deletepar: document.getElementById('moneda').value,
            usuario: usuario
          },function(data){            
            window.location.href="xbase?token="+usuario;
          });
        }
    });
}

function negativo(){
  let valor= "Limit";
  const usuario = document.getElementById('usuario').value;
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
            usuario: usuario,
            tipo: valor,
            cantidad: cantidad,
            precio: precio,
            moneda: moneda
          },function(data){});
        }
      });
}

function negativoBuy(id){ 
  const usuario = document.getElementById('usuario').value;
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
            usuario: usuario,
            negativo: id
        },function(data){
            if(data.includes("error")){
                //alert(data);
            }
        });
        }
      });
}

function borrar(id){
  const usuario = document.getElementById('usuario').value;
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
            borrar: id,
            usuario: usuario
          },function(data){});
        }
    });
}

function autosell(id){
  const usuario = document.getElementById('usuario').value;
  Swal.fire({
    title: 'xbase',
    text: "Confirma que quieres activar/desactivar el Auto Sell.? se vendera a precio de mercado",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Confirmo',
    showCancelButton: true,
    cancelButtonText: "No Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{
            autosell: id,
            usuario: usuario
          },function(data){});
        }
    });
}

function autostop(id){
  const usuario = document.getElementById('usuario').value;
  Swal.fire({
    title: 'xbase',
    text: "Confirma que quieres activar/desactivar el Auto STOP.? Al activar/desactivar el auto stop se calcularan las perdidas al nivel programado y se vendera a precio de mercado.",
    icon: 'info',
    confirmButtonColor: '#EC7063',
    confirmButtonText: 'Si Confirmo',
    showCancelButton: true,
    cancelButtonText: "No Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
          $.post("block",{
            autostop: id,
            usuario: usuario
          },function(data){});
        }
    });
}

function Reset(){
  const usuario = document.getElementById('usuario').value;
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
            document.getElementById("preloader").style.display='block';
            $.post("block",{
              reset:"",
              usuario: usuario,
              moneda: monedaValue.toUpperCase(),
              asset: assetValue.toUpperCase(),
              par: parValue.toUpperCase()
            },function(data){
              window.location.href="xbase?token="+usuario;
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
  const usuario = document.getElementById('usuario').value;
  document.getElementById("preloader").style.display='block';
  $.post("block",{ 
    changue:"",   
    usuario: usuario, 
    moneda: valor
  },function(data){
    document.getElementById('sugerirPrecioCompra').checked = true;
    window.location.href="xbase?token="+usuario;
  });
}

function local(){
  const usuario = document.getElementById('usuario').value;
  var valor= 0;
  if(document.getElementById('local').checked === true){
    valor = 1;
  }
  $.post("block",{
    local: valor,
    usuario: usuario
  },function(data){});
}

function xmes(){
  const usuario = document.getElementById('usuario').value;
  var valor= 0;
  $.post("block",{
    xgraf: valor,
    usuario: usuario
  },function(data){});
}

function xano(){
  const usuario = document.getElementById('usuario').value;
  var valor= 1;
  $.post("block",{
    xgraf: valor,
    usuario: usuario
  },function(data){});
}

function xgraf(){
  refreshDatos();
}

function bina(){
  const usuario = document.getElementById('usuario').value;
  var valor= 0;
  if(document.getElementById('orderBinance').checked === true){
    valor = 1;
  }
  $.post("block",{
    bina: valor,
    usuario: usuario
  },function(data){});
}

function alertas(data){
  let muted = document.getElementById("colorAlerta").value;
    if(data === "green" && muted == "un-mute"){
          jsNota(184.997);
    }
    else if (data === "yellow" && muted == "un-mute") {
          jsNota(329.628);
    }
}

function priceFixed(valor){
  return valor;
}

function toFixedWithoutRounding(num, decimals) {
  const factor = Math.pow(10, decimals);
  return Math.floor(num * factor) / factor;
}

function graficoLineal(graf){
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
        value: ['open', 'close','prm'],
      },
      colors: {
        close: '#EA465C',
        open: '#4DCB85',
        prm: '#f6f646'
    },
        types: {
            open: 'spline',
            close: 'spline',
            prm: 'spline'
        }
    },
    axis: {
        x: {
            type: 'timeseries',
            tick: {
                format: '%m-%d' // Formato de fecha
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
}

function graficoVelas(graf) {
  var dates = graf.map(item => item.date);
  var opens = graf.map(item => item.open);
  var highs = graf.map(item => item.high);
  var lows = graf.map(item => item.low);
  var closes = graf.map(item => item.close);

  var data = [{
      x: dates,
      close: closes,
      decreasing: {line: {color: 'red'}},
      high: highs,
      increasing: {line: {color: 'green'}},
      low: lows,
      open: opens,
      type: 'candlestick',
      xaxis: 'x',
      yaxis: 'y'
  }];

  var layout = {
      dragmode: 'zoom',
      showlegend: false,
      xaxis: {
          rangeslider: {
              visible: false
          }
      },
      responsive: true // Hacer el gráfico responsivo
  };

  Plotly.newPlot('chart', data, layout);
  
  window.addEventListener('resize', function() {
    Plotly.Plots.resize(document.getElementById('chart'));
});
}

function leerDatos() {
      document.getElementById('moneda').value = datos.moneda;
      document.getElementById('asset').value = datos.asset;   
      document.getElementById('estableCoin').value = datos.par;  
      document.getElementById('impuesto').value = (datos.impuesto * 1);
      document.getElementById('local').checked = datos.auto *1;      
      document.getElementById('orderBinance').checked = datos.bina *1;      
      document.getElementById('stop').value = datos.stop;
      document.getElementById('precio_venta').value = datos.precio_venta;
      document.getElementById('escalones').value = (datos.escalones * 1).toFixed(0);
}

function comprobarDatos() {
  if (datos) {
      leerDatos();
  } else {
      setTimeout(comprobarDatos, 500); // Revisa cada 500 ms si datos está lleno
  }
}

async function obtenerDatos() {
  const usuario = document.getElementById('usuario').value;
  try {
      let response = await fetch("block?getPriceBinance&usuario=" + usuario);
      let data = await response.json();
      datos = data;
      refreshDatos();
      console.log(data);
  } catch (error) {
      console.error('Error Obtener Datos:', error);
  }
}

function refreshDatos(){
  const graf = datos.grafico;

      if(document.getElementById('sugerirPrecioCompra').checked === true){
        document.getElementById('precioCompra').value = datos.price;
      }

      if(document.getElementById('sugerirPrecioVenta').checked === true){
        document.getElementById('precioCompra2').value = datos.price;
      }

      document.title = datos.asset+" "+datos.labelpricemoneda; 
      document.getElementById('priceMoneda').innerHTML = "<span style='margin-right:5px;color:white;'>"+datos.asset+"/"+datos.par+"</span> "+datos.labelpricemoneda;
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
      document.getElementById('animotrader').innerHTML = datos.animotrader;
      document.getElementById('nivelcompra').innerHTML = datos.nivelcompra;      
      document.getElementById('newBalance').value = datos.balance_asset;      
      document.getElementById('capital').value = priceFixed(datos.capital);      
      document.getElementById('showCapital').value = priceFixed(datos.capital);
      document.getElementById('ganancias').value = priceFixed(datos.ganancia - datos.perdida);      
      document.getElementById('priceMax').value = priceFixed(datos.maxdia);
      document.getElementById('mindia').innerHTML =`<span style='font-size:12px;color:white;'>L ${datos.mindia}</span> <div style='vertical-align: middle;display:inline-block;height:4px;width:55px;background:#E8DCDC;overflow:hidden;'><div style='background:grey;height:4px;width:${datos.porcenmax};'></div></div> <span style='font-size:12px;color:white;'>${datos.maxdia} H</span>`;
      document.getElementById('priceMin').value = priceFixed(datos.mindia);
      document.getElementById('disponible').value = priceFixed(datos.xdisponible);
      document.getElementById('showPerdidas').value = priceFixed(datos.perdida);
      document.getElementById('invxcompra').value = (datos.invxcompra *1).toFixed(2);
      document.getElementById('ultimaventa').value = datos.ultimaventa;
      document.getElementById('ultimacompra').value = datos.ultimacompra;
      document.getElementById('mbalance').value = datos.m_balance + datos.asset;      
      document.getElementById('balance').value = datos.m_balance;
      document.getElementById('perdidas').value = priceFixed(datos.perdida);
      document.getElementById('recordCount').value = datos.recordCount;
      document.getElementById('recupera').value = priceFixed(datos.recupera);
      let resultado = datos.m_balance * datos.price;
      document.getElementById('totalBalanceVenta').innerHTML = resultado.toFixed(2) +fiat;
      document.getElementById('cualmoneda').innerHTML = datos.asset;
      document.getElementById('cualmoneda2').innerHTML = datos.asset; 
      document.getElementById('xmes').checked = datos.checkMesGrafico;
      document.getElementById('xano').checked = datos.checkAnoGrafico;
      
      if((document.getElementById('disponible').value *1) < 10){
        document.getElementById("btAgregar").value = "1"; 
      }
      else{
        document.getElementById("btAgregar").value = "0";
      }      
      
      $("#priceMoneda").css("color",datos.color);
      $("#priceBtc").css("color",datos.colorbtc);
      $("#showCapital").css("color",datos.colordisp);
      $("#div3").html(datos.verescalones);
      $("#div2").html(datos.verbinance);
      $("#listasset").html(datos.listasset);

      // Crear el gráfico con C3.js
      if(datos.tipografico *1 == 0){
        graficoLineal(graf);
      }
      else{
        graficoVelas(graf);
      }

      alertas(datos.alert);
      fiat = datos.par;
      simbolo = datos.asset;

    document.getElementById('techo').innerHTML = "Ganancia ≈ 0.00";
    document.getElementById('piso').innerHTML = "0.00";
    escalon();
}

function inicio(){
    obtenerDatos();    
    recuperarMonedas();
    comprobarDatos();    
    document.getElementById("preloader").style.display='none';
    const myVar = setInterval(obtenerDatos, 120000);
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
  const usuario = document.getElementById('usuario').value;
  $.get("block?resetPerdidas&usuario="+usuario,function(data){})
}

function resetGanancias(){
  const usuario = document.getElementById('usuario').value;
  $.get("block?resetGanancias&usuario="+usuario,function(data){
    document.getElementById("ganancias").value = "0.00";
  })
}

function showConfig(){
  leerDatos();
  document.getElementById('config').showModal();
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
  $.get("block?cerrarSesion",function(data){
    window.location.href="index";
  })  
}

function selMonedas(){
  let optionMoneda = document.getElementById("monedas").value;
  const monedaEncontrada = listMonedas.find(itemMoneda => itemMoneda.ID === optionMoneda);
  if (optionMoneda) {
    document.getElementById("newMoneda").value = monedaEncontrada.MONEDA;
    document.getElementById("newAssetSimbol").value = monedaEncontrada.ASSET;
    document.getElementById("newEstableCoin").value = monedaEncontrada.PAR;
  }
}

function mostrarMonedas() {
  let fila = "<option value='' selected>selecciona una...</option>";
  const selectMoneda = document.getElementById("monedas");
  selectMoneda.innerHTML = fila;

  listMonedas.forEach((producto) => {
      let option = document.createElement("option");
      option.value = producto.ID;
      option.textContent = producto.MONEDA;
      selectMoneda.appendChild(option);
  });
}

function recuperarMonedas() {
  fetch("block?list_assets=")
      .then(response => {
          if (!response.ok) {
              throw new Error("Error en la solicitud: " + response.status);
          }
          return response.json(); // Parsear la respuesta como JSON
      })
      .then(data => {
          listMonedas = data;    
          mostrarMonedas();
          console.log("Monedas:", data);
      })
      .catch(error => {
          console.error("Error en la solicitud:", error);
      });
  
  }
