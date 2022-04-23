using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Http;

namespace TestFileUpload
{
    public class FileUploadController : ApiController
    {
        public string ruta;
        static SerialPort ard;
        [HttpPost]
        public KeyValuePair<bool, string> UploadFile()
        {
            ard = new SerialPort();
            ard.PortName = "COM5";
            ard.BaudRate = 9600;

            try
            {
                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/Recursos"), httpPostedFile.FileName);
                       // ruta = fileSavePath;
                       // CargarByte(fileSavePath);
                        httpPostedFile.SaveAs(fileSavePath);
                        string bts = Encoding.UTF8.GetString(ImageToBinary(fileSavePath));

                        File.WriteAllBytes(HttpContext.Current.Server.MapPath("~/Recursos/Imagenbits.txt"), CargarByte(fileSavePath));
                        //byte[] decBytes1 = Encoding.UTF8.GetBytes(bts);
                        //if (ard.IsOpen)
                        //{
                        //    try
                        //    {
                        //        ard.WriteLine(bts);
                        //    }
                        //    catch { }
                        //}
                        
                        return new KeyValuePair<bool, string>(true, "ima");
                    }
                    
                    return new KeyValuePair<bool, string>(true, "Could not get the uploaded file.");
                }

                return new KeyValuePair<bool, string>(true, "No file found to upload.");
            }
            catch (Exception ex)
            {
                return new KeyValuePair<bool, string>(false, "An error occurred while uploading the file. Error Message: " + ex.Message);
            }
        }

            public byte[] CargarByte(string Ruta) {
                                                        byte[] imagenBytes;
                                                        string nombreArchivo = Ruta;

                                                        if (File.Exists(nombreArchivo) == true)
                                                            imagenBytes = File.ReadAllBytes(nombreArchivo);
                                                        else
                                                            imagenBytes = null;
                                                        return imagenBytes;
            }

            public static byte[] ImageToBinary(string imagePath) {
                FileStream fS = new FileStream(imagePath, FileMode.Open, FileAccess.Read);
                byte[] b = new byte[fS.Length];
                fS.Read(b, 0, (int)fS.Length);
                fS.Close();
                return b;
            }


    }
}