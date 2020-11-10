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
    public partial class Alumno_u : System.Web.UI.Page
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Se crea la variable por que esta el parametro pMatricula en la url de la pantalla.
                int matricula = int.Parse(Request.QueryString["pMatricula"]);
                cargarFacultades();
                cargarAlumno(matricula);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            modificarAlumno();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Modificacion", "alert('Alumno modificado exitosamente');", true);
        }
        #endregion


        #region Metodos
        public void cargarAlumno(int Matricula)
        {
            AlumnoBLL alumnoBLL = new AlumnoBLL();
            DataTable dtAlumno = new DataTable();

            dtAlumno = alumnoBLL.cargarAlumno(Matricula);

            //Como la matricula es unica por eso se accede al indice 0
            lblMatricula.Text = dtAlumno.Rows[0]["Matricula"].ToString();
            txtNombre.Text = dtAlumno.Rows[0]["Nombre"].ToString();
            //El metodo Substring: lo que hace es que substrae la cadena a solo 10 caracteres de la cadena original
            txtFechaNacimiento.Text = dtAlumno.Rows[0]["FechaNacimiento"].ToString().Substring(0,10);
            txtSemestre.Text = dtAlumno.Rows[0]["Semestre"].ToString();
            ddlFacultad.SelectedValue = dtAlumno.Rows[0]["Facultad"].ToString();
        }

        //Nos traemos el metodo para que se cargue el drowdon list de las facultades y al igual hacemos la validacion del IsPostBack
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

        public void modificarAlumno()
        {
            AlumnoBLL alumnoBLL = new AlumnoBLL();
            int Matricula = int.Parse(lblMatricula.Text);
            string Nombre = txtNombre.Text;
            DateTime FechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);
            int Semestre = int.Parse(txtSemestre.Text);
            int Facultad = int.Parse(ddlFacultad.SelectedValue);

            alumnoBLL.modificarAlumno(Matricula,Nombre,FechaNacimiento,Semestre,Facultad);
        }
        #endregion
    }
}