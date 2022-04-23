<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chat.aspx.cs" Inherits="Net.SignalR.WebApp.Client.Scripts.chat" %>

        <!DOCTYPE html>
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head runat="server">
                            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                            <title></title>
                            <link href="App_Themes/Tema/Chat.css" rel="stylesheet" type="text/css" />
                            <script src ="Scripts/json2.js" type="text/jscript"></script>
                            <%--<script src="Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>--%>
                            <script src="Scripts/jquery2.1.1.min.js"></script>
                            <script src="Scripts/jquery.signalR-0.5.3.min.js" type="text/javascript"></script>

     <%--PROGRAMA EN JAVASCRIPT PARA ENVIAR Y RECIBIR TEXTO E IMAGENES--%>

    <script type="text/javascript">
        $(document).ready(function () {
            var compare = "";
            var sou = "<audio autoplay='autoplay' controls='controls'> <source src='/Recursos/Audios/Whistle.mp3'/>  </audio> ";

                                                                                         var connection = $.hubConnection('http://localhost:8080/'); //Variable de coexion al servidor donde se realiza conexion co arduino 
                                                                                         proxy = connection.createProxy('collectionhub')
                                                                                         connection.start()   //inicializar conexion
                                                                                         .done(function () { //FUCION PARA INVOCAR AL SERVIDOR
                                                                                                              proxy.invoke('subscribe', 'Product');
                                                                                                              $('#mensaje').append('<li>SE HA ESTABLECIDO CONEXION AL SERVIDOR </li>');
                                                                      })
                                                                                        .fail(function () { alert("NO SE PUEDE CONECTAR AL SERVIDOR NI A ARDUINO!"); });
                                           
                                                                                              proxy.on('flush', function (msg) { // FUNCION MUESTRA EL MENSAJE RECIBIDO DESDE ARDUINO
                                                                                            
                                                                                                  if (compare != msg) {

                                                                                                      $('#mensaje').append('<li>' + msg + '</li>'); //IMPRIME HTML MOSTRANDO EL MENSAJE
                                                                                                      $('#sound').append(sou);
                                                                                                  }
                                                                                                  else {
                                                                                                      alert("MENSAJE ENVIADO: "+msg);
                                                                                                  }

                                                                                              compare = msg;

                                                                                             var objDiv = document.getElementById("chatbox");
                                                                                             objDiv.scrollTop = objDiv.scrollHeight;

                                                                    });



                                                                    $("#EMITIRd").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO
                
                                                                        var sent = "Edison Dice: "+$("#DATOSAENVIAR").val();

                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                       
                                                                        
                                                                        $("#DATOSAENVIAR").val("");
                                                                    });

                                                                    
                                                                    $("#imagen1").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagenuno.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='"+ sent +"' width='200' height='200'/>");

                                                                        //$('#btnUploadFile').click();
                                                                       // $("#fileUpload").val();
  //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen2").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagendos.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen3").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagentres.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen4").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagencuatro.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen5").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagencinco.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen6").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagenseis.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='"+ sent+"' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen7").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagensiete.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);

                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen8").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagenocho.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);
                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");

                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen9").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagennueve.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);

                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });
                                                                    $("#imagen10").click(function () {   //FUNCION PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO

                                                                        var sent = "/Recursos/imagendiez.jpg";
                                                                        proxy.invoke('Publish2', sent, 'Product', 0);

                                                                        $('#mensaje').append('<li> Enviaste Una Imagen' + '</li>');
                                                                        $('#mensaje').append("<img src='" + sent + "' width='200' height='200'/>");
                                                                        //                                                                      $("#DATOSAENVIAR").val("");
                                                                    });

                                                                    $("#DATOSAENVIAR").keypress(function (event) {

                                                                        if( event.which == 13 ){
                                                                                         var snt = "Edison Dice: " + $("#DATOSAENVIAR").val();
                                                                                         proxy.invoke('Publish2', snt, 'Product', 0);
                                                                                        $("#DATOSAENVIAR").val("");
                                                                                       
                                                                                        event.preventDefault();
                                                                                        //alert('enter was pressed');
                                                                        }
                                                                    });


                                                                    $('#btnUploadFile').on('click', function () {
                                                                                                                 var data = new FormData();
                                                                                                                 var files = $("#fileUpload").get(0).files;

                // Add the uploaded image content to the form data collection
                                                                                                                if (files.length > 0) {
                                                                                                                    data.append("UploadedImage", files[0]);
                                                                                                                }

                // Make Ajax request with the contentType = false, and procesDate = false
                                                                                                                var ajaxRequest = $.ajax({
                                                                                                                    type: "POST",
                                                                                                                    url: "/api/fileupload/uploadfile",
                                                                                                                    contentType: false,
                                                                                                                    processData: false,
                                                                                                                    data: data
                                                                                                                });

                                                                                                                ajaxRequest.done(function (responseData, textStatus) {
                                                                                                                    if (textStatus == 'success') {
                                                                                                                        if (responseData != null) {
                                                                                                                            if (responseData.Key) {
                                                                                                                                alert(responseData.Value);
                                                                                                                                //here show img
                                                                                                                                $('#mensaje').append("<img src='Recursos/"+$("#fileUpload").val()+"' width='200' height='200'/>");
                                                                                                                                $("#fileUpload").val('');
                                                                                                                               // $('#messages').append('<li>SE HA ESTABLECIDO CONEXION AL SERVIDOR </li>');
                                                                                                                                proxy.invoke('Publish2', responseData.Value, 'Product', 1);
                                                                                                                            } else {
                                                                                                                                alert(responseData.Value);
                                                                                                                            }
                                                                                                                        }
                                                                                                                    } else {
                                                                                                                        alert(responseData.Value);
                                                                                                                    }
                                                                                                                });
                                    });

                                });
    </script>


 <%--CODIGO HTML - PARTE GRAFICA--%>

</head>
<body>
    <%--<embed height="200" width="200" src="/Recursos/Audios/Whistle.mp3" /></embed>--%>

        <%--<form id="form1" runat="server">--%>
              <div> 
                   <div class="wrapper">
			            <h1>Chat Arduino Bluetooh</h1>
			                <div class="content">
				                 <div id="form_wrapper" class="form_wrapper">
					                      <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
					                      <form class="login active">
						                        <h3>Uusario</h3>
						                            <div id ="chatbox" style="height:300px; overflow-y: auto;">
                                                          <ul id="mensaje"></ul>
						                           </div>
						                 <div class="bottom">
							                  <input type="text" id="DATOSAENVIAR" />
                                              <input id="EMITIRd" type="button" value="Enviar"/> <br />
                                             <%--   <asp:FileUpload ID="exam" runat="server" />
                                                  <input id="file" type="button" value="Enviar"/>--%>
                                             <%--<input type="file" id="fileUpload" />
                                            <br />
                                            <input type="button" value="Upload File" id="btnUploadFile" />--%>
							                <div class="clear"></div>
                                             <div id="sound" style="display:none"></div>
						        </div>
					<%--</form>--%>
				</div>
				<div class="clear"></div>
			</div>
			&nbsp;</div></div></form>
    <div id="carrusel" style="text-align:center; background:#ffd800;  border-radius:20px; width:1200px; margin:auto; padding:30px" >
    <img id="imagen1" alt="" src="Recursos/imagenuno.jpg" width="100" height="100" onclick="imagen_enviar()"/> <img id="imagen2" alt="Recursos/imagendos.jpg" src="Recursos/imagendos.jpg" width="100" height="100" onclick="imagen_enviar"/> 
    <img alt="imagen3" src="Recursos/imagentres.jpg" width="100" height="100" onclick="imagen_enviar();"/> <img id="imagen4" alt="Recursos/water.jpg" src="Recursos/imagencuatro.jpg" width="100" height="100" onclick="imagen_enviar"/> 
    <img alt="imagen5" src="Recursos/imagencinco.jpg" width="100" height="100" onclick="imagen_enviar();"/> <img id="imagen6" alt="Recursos/water.jpg" src="Recursos/imagenseis.jpg" width="100" height="100" onclick="imagen_enviar"/> 
    <img alt="imagen7" src="Recursos/imagensiete.jpg" width="100" height="100" onclick="imagen_enviar();"/> <img id="imagen8" alt="Recursos/water.jpg" src="Recursos/imagenocho.jpg" width="100" height="100" onclick="imagen_enviar"/> 
    <img alt="imagen9" src="Recursos/imagennueve.jpg" width="100" height="100" onclick="imagen_enviar();"/> <img id="imagen10"alt="Recursos/water.jpg" src="Recursos/imagendiez.jpg" width="100" height="100" onclick="imagen_enviar"/> 
    </div>
    <br />
    <br />
</body>
</html>
