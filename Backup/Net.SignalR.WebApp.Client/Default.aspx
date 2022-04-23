<html xmlns="http://www.w3.org/1999/xhtml">
    <script src ="Scripts/json2.js" type="text/jscript"></script>
    <script src="Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.signalR-0.5.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
           $(function () {
               var connection = $.hubConnection('http://localhost:8081/');
               proxy = connection.createProxy('collectionhub')
               connection.start()
                    .done(function () {
                        proxy.invoke('subscribe', 'Product');
                        $('#messages').append('<li>Subscribed</li>');
                    })
                    .fail(function () { alert("Could not Connect!"); });


               proxy.on('flush', function (msg) {
                   $('#messages').append('<li>' + msg + '</li>');
               });

               $("#broadcast").click(function () {
                   proxy.invoke('Publish', $("#dataToSend").val(), 'Product');
               });

           });
    </script>
    <body>
        <div>
            <ul id="messages"></ul>
            <input type="text" id="dataToSend" />
            <input id="broadcast" type="button" value="Send"/>
        </div>
    </body>
</html>
