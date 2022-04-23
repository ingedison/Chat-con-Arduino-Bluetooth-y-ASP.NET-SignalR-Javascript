using SignalR.Client.Hubs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO.Ports;
using System.Text;
using System.ComponentModel;
using System.Threading;
using System.IO;


namespace Net.SignalR.Console.Client
{

    class Program
    {
        static SerialPort ardo;
         

         static void Main(string[] args){
                 ardo = new SerialPort();
                 ardo.PortName = "COM5";
                 ardo.BaudRate = 9600;
              
                bool a = true;
                int x = 0;
                StringComparer stringComparer = StringComparer.OrdinalIgnoreCase;

                var hubConnection = new HubConnection("http://localhost:8080/");
                var serverHub = hubConnection.CreateProxy("CollectionHub");


                ardo.Open();
                serverHub.On("flush", messages => ardo.WriteLine(messages));
                serverHub.On("flush", messages => ardo.BaseStream.Flush());
                //serverHub.On("flush", messages => ardo.Close());
                hubConnection.Start().Wait();
                serverHub.Invoke("Subscribe", "Product");

                string line = null;
                String recibido = null;

                            while (true) {

                                if (File.Exists(@"D:\Users\Edison\Desktop\Arduino Bluetooh\Net.SignalR.WebApp.Client\Recursos\Imagenbits.txt"))
                                {
                                    
                                    byte[] imagenbytes = File.ReadAllBytes(@"D:\Users\Edison\Desktop\Arduino Bluetooh\Net.SignalR.WebApp.Client\Recursos\Imagenbits.txt");

                                    System.Console.WriteLine(imagenbytes.Length);

                                   // for (int xs = 0; xs < imagenbytes.Length; xs++)
                                    //{
                                        ardo.Write(imagenbytes, 0, imagenbytes.Length);
                                        string bts = Encoding.UTF8.GetString(imagenbytes);
                                        ardo.DiscardOutBuffer();
                                        //System.Console.WriteLine("se ha enviado: " + xs + " bytes");
                                      //  xs++;
                                    //}
                                  System.Console.WriteLine("Imagen Enviada");
                                    File.Delete(@"D:\Users\Edison\Desktop\Arduino Bluetooh\Net.SignalR.WebApp.Client\Recursos\Imagenbits.txt");
                                }

                                try
                                {
                                            recibido = ardo.ReadLine().TrimEnd();
                                            serverHub.Invoke("Publish", recibido.TrimEnd(), "Product", 0).Wait();
                                            ardo.BaseStream.Flush();
                                            //Thread.Sleep(500);
                                           
                                }
                                catch { }
                                //ardo.Close();
                                //recibido = ardo.ReadLine().TrimEnd();
                            }

                ardo.Close();
            }

    }
}
