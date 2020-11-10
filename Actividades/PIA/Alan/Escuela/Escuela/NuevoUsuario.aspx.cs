using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CdisMart.CapaDatos;
using CdisMart.CapaLogica;
using CdisMart.Web;
using Escuela.CapaDatos;

namespace Escuela
{
    public partial class NuevoUsuario : ClaseTema, IAcceso
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        public void AgregarUsuarios()
        {
            UsuarioDAL oUsuario = new UsuarioDAL();
            UsuarioBLL oUsuarioBll = new UsuarioBLL();
            User oUser = new User();

            oUser.UserName = txtNombreUsuario.Text;
            oUser.Password = txtContrasena.Text;
            //if (oUser.Password == txtConfirmarContasena.Text)
            //{
            //    oUser.Password = txtContrasena.Text;
            //}
            //else
            //{
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('Las Contaseñas no coinciden');", true);
            //}
            oUser.Name = txtNombreCompleto.Text;
            oUser.Email = txtEmail.Text;
            oUser.Type = "Usuario";

            try
            {
                oUsuarioBll.AgregarUsuario(oUser);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + ex.Message + "');", true);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarUsuarios();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alta", "alert('Usuario Agregado Exitosamente);", true);
        }

        public bool SessionIniciada()
        {
            throw new NotImplementedException();
        }
    }
}