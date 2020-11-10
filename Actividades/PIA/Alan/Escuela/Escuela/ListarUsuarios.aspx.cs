using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CdisMart.CapaLogica;
using System.Data;
using CdisMart.Web;

namespace Escuela
{
    public partial class ListarUsuarios : ClaseTema, IAcceso
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grd_Usuarios.DataSource = ListarUsuario();
                grd_Usuarios.DataBind();

                //Response.Redirect("~/Login.aspx");
            }
        }

        public List<object> ListarUsuario()
        {
            UsuarioBLL Usuariobll = new UsuarioBLL();
            List<object> lst = new List<object>();

            lst = Usuariobll.ListarUsuarios();
            return lst;
        }

        public bool SessionIniciada()
        {
            if (Session["Usuario"] != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}