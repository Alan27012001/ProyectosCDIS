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
    public partial class Alumno_i : System.Web.UI.Page
    {
        #region "Eventos"
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                cargarFacultades();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarAlumno();
            Page.ClientScript.RegisterStartupScript(this.GetType(),"Alta","alert('Alumno Agregado exitosamente');",true);
        }
        #endregion

        # region Metodos
        public void AgregarAlumno()
        {
            AlumnoBLL alumnoBLL = new AlumnoBLL();
            int Matricula = int.Parse(txtMatricula.Text);
            string Nombre = txtNombre.Text;
            DateTime FechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
            int Semestre = int.Parse(txtSemestre.Text);
            int Facultad = int.Parse(ddlFacultad.SelectedValue);

            alumnoBLL.AgregarAlumno(Matricula,Nombre,FechaNacimiento,Semestre,Facultad);
        }

        public void cargarFacultades()
        {
            FacultadBLL facultadBLL = new FacultadBLL();
            DataTable dtFacultades = new DataTable();

            dtFacultades = facultadBLL.cargarFacultades();

            ddlFacultad.DataSource = dtFacultades;
            ddlFacultad.DataTextField = "Nombre";
            ddlFacultad.DataValueField = "Id_Facultad";
            ddlFacultad.DataBind();

            ddlFacultad.Items.Insert(0, new ListItem("-------Seleccione Facultad-------", "0"));
        }
        #endregion
    }
}