using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Escuela.CapaLogica;
using Escuela.CapaDatos;

namespace Escuela.Facultades
{
    public partial class Facultad_d : ClaseTema, IAcceso
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionIniciada())
                {
                    //Se crea la variable por que esta el parametro pMatricula en la url de la pantalla.
                    int IdFacultad = int.Parse(Request.QueryString["pIdFacultad"]);
                    cargarUniversidad();
                    cargarPais();
                    cargarEstados();
                    cargarCiudades();
                    cargarFacultad(IdFacultad);
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            eliminarFacultad();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Eliminación", "alert('Facultad Eliminada exitosamente');", true);
        }

        protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPais.SelectedIndex != 0)
            {
                ddlEstado.Items.Clear();
                cargarEstados();
            }
            else
            {
                ddlEstado.Items.Clear();
            }
        }

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEstado.SelectedIndex != 0)
            {
                ddlCiudad.Items.Clear();
                cargarCiudades();
            }
            else
            {
                ddlCiudad.Items.Clear();
            }
        }
        #endregion


        #region Metodos
        public void cargarFacultad(int Id)
        {
            FacultadBLL facultadBLL = new FacultadBLL();
            Facultad oFacultad = new Facultad();

            oFacultad = facultadBLL.cargarFacultad(Id);

            //Como la matricula es unica por eso se accede al indice 0
            lblIdFacultad.Text = oFacultad.Id_Facultad.ToString();
            lblCodigo.Text = oFacultad.Codigo.ToString();
            lblNombre.Text = oFacultad.Nombre.ToString();
            //El metodo Substring: lo que hace es que substrae la cadena a solo 10 caracteres de la cadena original
            lblFechaCreacion.Text = oFacultad.FechaCreacion.ToString().Substring(0, 10);
            ddlUniversidad.SelectedValue = oFacultad.Universidad.ToString();

            cargarPais();
            ddlPais.SelectedValue = oFacultad.Ciudad.Estado.IdPais.ToString();

            cargarEstados();
            ddlEstado.SelectedValue = oFacultad.Ciudad.IdEstado.ToString();

            cargarCiudades();
            ddlCiudad.SelectedValue = oFacultad.IdCiudad.ToString();
        }

        //Nos traemos el metodo para que se cargue el drowdon list de las facultades y al igual hacemos la validacion del IsPostBack
        public void cargarUniversidad()
        {
            UniversidadBLL universidadBLL = new UniversidadBLL();
            List<Universidad> lst = new List<Universidad>();

            lst = universidadBLL.cargarUniversidad();

            ddlUniversidad.DataSource = lst;
            ddlUniversidad.DataTextField = "Nombre";
            ddlUniversidad.DataValueField = "Id_Universidad";
            ddlUniversidad.DataBind();

            ddlUniversidad.Items.Insert(0, new ListItem("-------Seleccione Universidad-------", "0"));
        }

        public void cargarPais()
        {
            PaisBLL oPais = new PaisBLL();
            DataTable dtPais = new DataTable();
            dtPais = oPais.cargarPais();

            ddlPais.DataSource = dtPais;
            ddlPais.DataTextField = "Nombre";
            ddlPais.DataValueField = "Id";
            ddlPais.DataBind();

            ddlPais.Items.Insert(0, new ListItem("-----------Seleccione Pais----------", "0"));
        }

        public void cargarEstados()
        {
            EstadoBLL oEstado = new EstadoBLL();
            DataTable dtEstado = new DataTable();

            dtEstado = oEstado.cargarEstadoPorPais(int.Parse(ddlPais.SelectedValue));

            ddlEstado.DataSource = dtEstado;
            ddlEstado.DataTextField = "Nombre";
            ddlEstado.DataValueField = "Id";
            ddlEstado.DataBind();

            ddlEstado.Items.Insert(0, new ListItem("-------------Seleccione Estado------------", "0"));
        }

        public void cargarCiudades()
        {
            CiudadBLL oCiudad = new CiudadBLL();
            DataTable dtCiudad = new DataTable();

            dtCiudad = oCiudad.cargarCiudadesPorEstado(int.Parse(ddlEstado.SelectedValue));

            ddlCiudad.DataSource = dtCiudad;
            ddlCiudad.DataTextField = "Nombre";
            ddlCiudad.DataValueField = "Id";
            ddlCiudad.DataBind();

            ddlCiudad.Items.Insert(0, new ListItem("-------------Seleccione Ciudad------------", "0"));
        }

        public void eliminarFacultad()
        {
            FacultadBLL facultadBLL = new FacultadBLL();
            int Id = int.Parse(lblIdFacultad.Text);

            facultadBLL.eliminarFacultad(Id);
        }
        #endregion

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Facultad_s.aspx");
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