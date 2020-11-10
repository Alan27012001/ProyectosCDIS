using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;

namespace CdisMart.Web
{
    public class ClaseTema : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Usuario"];

                string tipo = dt.Rows[0]["Type"].ToString();
                if (tipo == "Administrador")
                {
                    Page.Theme = "Tema1";
                }
                else
                {
                    Page.Theme = "Tema2";
                }
            }
        }
    }
}