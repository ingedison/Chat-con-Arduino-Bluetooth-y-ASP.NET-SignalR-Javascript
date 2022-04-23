using System;
using System.Threading.Tasks;
using SignalR.Hosting.Self;
using SignalR.Hubs;

namespace Net.SignalR.SelfHost{
    
    class Program{
                        static void Main(string[] args){
                            string url = "http://localhost:8080/";

                            var server = new Server(url);
                            server.MapHubs();
            
                            server.Start();
                            Console.WriteLine("El servidor se inicio en: " + url);

                            while (true)
                            {
                                        ConsoleKeyInfo ki = Console.ReadKey(true);
                                        if (ki.Key == ConsoleKey.X)
                                        {
                                            Console.WriteLine("ha salido: " + url);
                                            break;
                                        }
                          }
        }


                    public class CollectionHub : Hub
                    {
                                                public void Subscribe(string collectionName)
                                                {
                                                    Groups.Add(Context.ConnectionId, collectionName);
                                                    Console.WriteLine("Se ha conectado a: " + collectionName);
                                                }

                                                public Task Unsubscribe(string collectionName)
                                                {
                                                    return Clients[collectionName].leave(Context.ConnectionId);
                                                }

                                                public void Publish(string message, string collection, int t)
                                                {
                                                        Clients[collection].flush("" + message);
                                                }

                                                public void Publish2(string mes, string collection, int t)
                                                {
                                                    Clients[collection].flush("" + mes);
                                                }
        }

    }
}
