using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Escuela.CapaLogica;
using Escuela.CapaDatos;

namespace Escuela.Facultades
{
    public partial class Facultad_i : ClaseTema, IAcceso
    {
        #region "Eventos"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionIniciada())
                {
                    cargarUniversidad();
                    cargarPais();
                    cargarEstados();
                    cargarCiudades();
                    CargarTabla();
                    cargarMaterias();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
                
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarFacultad();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alta", "alert('Facultad Agregada exitosamente');", true);
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Facultad_s.aspx");
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
        public void AgregarFacultad()
        {
            FacultadBLL facultadBLL = new FacultadBLL();

            Facultad oFacultad = new Facultad();

            oFacultad.Codigo = (txtCodigo.Text).ToUpper();
            oFacultad.Nombre = txtNombre.Text;
            oFacultad.FechaCreacion = Convert.ToDateTime(txtFechaCreacion.Text);
            oFacultad.Universidad = int.Parse(ddlUniversidad.SelectedValue);
            oFacultad.IdCiudad = int.Parse(ddlCiudad.SelectedValue);

            //string Codigo = (txtCodigo.Text).ToUpper();
            //string Nombre = txtNombre.Text;
            //DateTime FechaCreacion = Convert.ToDateTime(txtFechaCreacion.Text);
            //int Universidad = int.Parse(ddlUniversidad.SelectedValue);
            //int Ciudad = int.Parse(ddlCiudad.SelectedValue);
            try
            {
                MateriaFacultad materiaFacultad;
                List<MateriaFacultad> lst = new List<MateriaFacultad>();

                foreach (ListItem item in LstMaterias.Items)
                {
                    if (item.Selected)
                    {
                        materiaFacultad = new MateriaFacultad();
                        materiaFacultad.IdMateria = int.Parse(item.Value);
                        materiaFacultad.IdFacultad = oFacultad.Id_Facultad;
                        lst.Add(materiaFacultad);
                    }
                }

                facultadBLL.AgregarFacultad(oFacultad,lst);
                LimpiarCampos();

                #region "Vista Parcial"
                DataTable dtFacultad = new DataTable();
                dtFacultad = (DataTable)ViewState["tablafacultad"];
                dtFacultad.Rows.Add(oFacultad.Codigo, oFacultad.Nombre, oFacultad.FechaCreacion);

                //ViewState: Es una variable donde almacena informacion de manera temporal
                grdFacultad.DataSource = dtFacultad;
                grdFacultad.DataBind();
                #endregion
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alta", "alert('" + ex.Message + "');", true);
            }
        }

        public void cargarUniversidad()
        {
            UniversidadBLL universidadBLL = new UniversidadBLL();
            List<Universidad> lst = new List<Universidad>();

            lst = universidadBLL.cargarUniversidad();

            ddlUniversidad.DataSource = lst;
            ddlUniversidad.DataTextField = "Nombre";
            ddlUniversidad.DataValueField = "Id_Universidad";
            ddlUniversidad.DataBind();

            ddlUniversidad.Items.Insert(0, new ListItem("-----------Seleccione Universidad----------", "0"));
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

            ddlPais.Items.Insert(0, new ListItem("---------------Seleccione Pais--------------", "0"));
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

            ddlEstado.Items.Insert(0, new ListItem("-------------Seleccione Estado-------------", "0"));
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

            ddlCiudad.Items.Insert(0, new ListItem("--------------Seleccione Ciudad------------", "0"));
        }

        public void cargarMaterias()
        {
            MateriaBLL oMateria = new MateriaBLL();
            List<Materia> lst = new List<Materia>();

            lst = oMateria.cargarMaterias();

            LstMaterias.DataSource = lst;
            LstMaterias.DataTextField = "Nombre";
            LstMaterias.DataValueField = "Id";
            LstMaterias.DataBind();
        }

        public bool SessionIniciada()
        {
            if(Session["Usuario"] != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void LimpiarCampos()
        {
            txtCodigo.Text = "";
            txtFechaCreacion.Text = "";
            txtNombre.Text = "";
            ddlUniversidad.SelectedIndex = 0;
        }

        public void CargarTabla()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Codigo");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("FechaCreacion");

            ViewState["tablafacultad"] = dt;
        }

        #endregion
    }
}