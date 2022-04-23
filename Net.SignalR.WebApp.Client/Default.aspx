<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Net.SignalR.WebApp.Client.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="App_Themes/Tema/Estilos.css" rel="stylesheet" type="text/css" />
    </head>
    <script src ="Scripts/json2.js" type="text/jscript"></script>
    <script src="Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.signalR-0.5.3.min.js" type="text/javascript"></script>

    <script type="text/javascript">
                                        $(function () {
                                            var connection = $.hubConnection('http://localhost:8080/');
                                            proxy = connection.createProxy('collectionhub')
                                            connection.start()
                                                                 .done(function () { //FUCION PARA INVOCAR AL SERVIDOR
                                                                                     proxy.invoke('subscribe', 'Product');
                                                                                     $('#mensaje').append('<li>SE HA ESTABLECIDO CONEXION AL SERVIDOR </li>');
                                                                 })
                                                                .fail(function () { alert("NO SE PUEDE CONECTAR AL SERVIDOR Y ARDUINO!"); }); 


                                                                proxy.on('flush', function (msg) { // FUNCION MUESTRA EL MENSAJE RECIBIDO DESDE ARDUINO
                                                                    $('#mensaje').append('<li>' + msg + '</li>'); //IMPRIME HTML MOSTRANDO EL MENSAJE
                                                                });

                                                                

                                                                $("#EMITIR").click(function () {   //FUNCIO PARA ENVIAR DATOS DESDE LA CAJA DE TEXTO
                                                                    proxy.invoke('Publish', $("#DATOSAENVIAR").val(), 'Product');
                                                                    //dataToSend

                                                                });

                                            });
    </script>

    <body>

          <div class="container">
	<section id="content">
		<form ID="form1" runat="server">
			<h1>Iniciar Sesión</h1>
			<div>
				<input type="text" placeholder="Username" required="" id="username" />
			</div>
			<div>
				<input type="password" placeholder="Password" required="" id="password" />
			</div>
			<div>
				<%--<input type="submit" value="Entrar" />--%><asp:Button ID="Button1" runat="server" Text="Entrar" OnClick="Button1_Click" />
<%--				<a href="#">Lost your password?</a>
				<a href="#">Register</a>--%>
			</div>
		</form><!-- form -->
		<div class="button">
			                             <div>
                                                <ul id="mensaje"></ul>

                                               <%-- <input type="text" id="DATOSAENVIAR" />

                                                <input id="EMITIR" type="button" value="Enviar"/>

                                                <form id="Form1" runat="server">
                                               </form>--%>
                                            </div>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
                                           
    </body>
</html>
