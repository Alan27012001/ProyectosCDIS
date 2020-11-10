using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Escuela
{
    public partial class VistaGlobaEscuela : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Usuario"];

                string tipo = dt.Rows[0]["Type"].ToString();
                if (tipo == "Administrador")
                {
                    lblMenuOp.Text = "BIENVENIDO ADMINISTRADOR";
                    lblUsuario.Text = "Bienvenido sr(a). Alan";
                    ImgOpcion.ImageUrl = "Imagenes/alan.jpg";
                }
                else
                { 
                    lblMenuOp.Text = "BIENVENIDO MAESTRO";
                    lblUsuario.Text = "Bienvenido sr(a). James";
                    ImgOpcion.ImageUrl = "Imagenes/James.jpg";
                }
            }
        }
    }
}