using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CdisMart.CapaLogica;
using System.Data;

namespace Escuela
{
    public partial class Login : System.Web.UI.Page
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["Usuario"] = null;
            }
        }

        protected void btnSesion_Click(object sender, EventArgs e)
        {
            if (ValidarUsuario())
            {
                Response.Redirect("~/PanelGeneral.aspx");
            }
            else
            {
                Response.Write("<script>alert('Usuario y/o contraseña Incorrectos.')</script>");
                LimpiarCampo();
            }
        }
        #endregion

        #region Metodos
        public bool ValidarUsuario()
        {
            bool acceso = false;
            UsuarioBLL oUsuario = new UsuarioBLL();
            DataTable dtUsuario = new DataTable();

            dtUsuario = oUsuario.ConsultarUsuario(LoginUser.UserName, LoginUser.Password);

            if (dtUsuario.Rows.Count > 0)
            {
                Session["Usuario"] = dtUsuario;
                acceso = true;
            }
            return acceso;
        }

        public void LimpiarCampo()
        {
            LoginUser.UserName = "";
        }
        #endregion
    }
}