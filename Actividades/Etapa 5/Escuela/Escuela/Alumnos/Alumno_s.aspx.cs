using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Escuela_BLL;

namespace Escuela.Alumnos
{
    public partial class Alumno_s : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grd_alumnos.DataSource = CargarAlumnos();
                grd_alumnos.DataBind();
            }
        }

        protected void grd_alumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/Alumnos/Alumno_u.aspx?pMatricula="+e.CommandArgument);
            }
            else
            {
                Response.Redirect("~/Alumnos/Alumno_d.aspx?pMatricula="+e.CommandArgument);
            }
        }

        public DataTable CargarAlumnos()
        {
            AlumnoBLL alumnoBLL = new AlumnoBLL();
            DataTable dtAlumnos = new DataTable();

            dtAlumnos = alumnoBLL.cargarAlumnos();
            return dtAlumnos;
        }
    }
}