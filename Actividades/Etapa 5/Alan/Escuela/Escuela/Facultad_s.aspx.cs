using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Escuela.CapaLogica;
using System.Data;
using System.Web.Services;

namespace Escuela.Facultades
{
    public partial class Facultad_s : ClaseTema, IAcceso
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionIniciada())
                {
                    grd_facultades.DataSource = CargarFacultades();
                    grd_facultades.DataBind();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        protected void grd_facultades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/Facultad_u.aspx?pIdFacultad=" + e.CommandArgument);
            }
            else
            {
                Response.Redirect("~/Facultad_d.aspx?pIdFacultad=" + e.CommandArgument);
            }
        }

        public List<object> CargarFacultades()
        {
            FacultadBLL facultadBLL = new FacultadBLL();
            List<object> lst = new List<object>();

            lst = facultadBLL.CargarFacultades();
            return lst;
        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PanelGeneral.aspx");
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