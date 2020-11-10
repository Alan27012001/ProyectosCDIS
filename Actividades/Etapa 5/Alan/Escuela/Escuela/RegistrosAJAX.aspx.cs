using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Escuela.CapaDatos;
using System.Web.UI.WebControls;
using Escuela.CapaLogica;
using System.Web.Services;
using Escuela.ServiceReference1;

namespace Escuela
{
    public partial class RegistrosAJAX : ClaseTema, IAcceso
    {
        public bool SessionIniciada()
        {
            throw new NotImplementedException();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PanelGeneral.aspx");
        }

        private void Consultar()
        {
            using (FacultadClient oFacultad = new FacultadClient())
            {
                grilla.DataSource = oFacultad.Consultar();
                grilla.DataBind();
            }
        }

        protected void btnconsultar_Click(object sender, EventArgs e)
        {
            Consultar();
        }
    }
}