using System;
using System.Collections.Generic;
using System.Linq;
//using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO.Ports;
using System.Text;
using System.ComponentModel;
//ndows;
namespace Net.SignalR.WebApp.Client
{
    public partial class Inicio : System.Web.UI.Page
    {
        //SerialPort ardo;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("chat.aspx");
        }
    }
}