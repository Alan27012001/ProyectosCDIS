using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Escuela.CapaLogica;
using System.Data;
using Escuela.CapaDatos;

namespace Escuela.Facultades
{
    public partial class Facultad_u : ClaseTema, IAcceso
    {
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionIniciada())
                {
                    //Se crea la variable por que esta el parametro pMatricula en la url de la pantalla.
                    int Id = int.Parse(Request.QueryString["pIdFacultad"]);
                    cargarUniversidad();
                    cargarPais();
                    cargarEstados();
                    cargarCiudades();
                    cargarFacultad(Id);
                    cargarMaterias();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            modificarFacultad();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Modificacion", "alert('Facultad Modificada exitosamente');", true);
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
            if (ddlCiudad.SelectedIndex != 0)
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
            Facultad facultad = new Facultad();

            facultad = facultadBLL.cargarFacultad(Id);

            //Como la matricula es unica por eso se accede al indice 0

            lblIdFacultad.Text = facultad.Id_Facultad.ToString();
            txtCodigo.Text = facultad.Codigo;
            txtNombre.Text = facultad.Nombre;
            txtFechaCreacion.Text = facultad.FechaCreacion.ToString().Substring(0,10);
            ddlUniversidad.SelectedValue = facultad.Universidad.ToString();
            //lblIdFacultad.Text = dtFacultad.Rows[0]["Id_Facultad"].ToString();
            //txtCodigo.Text = dtFacultad.Rows[0]["Codigo"].ToString();
            //txtNombre.Text = dtFacultad.Rows[0]["Nombre"].ToString();
            ////El metodo Substring: lo que hace es que substrae la cadena a solo 10 caracteres de la cadena original
            //txtFechaCreacion.Text = dtFacultad.Rows[0]["FechaCreacion"].ToString().Substring(0, 10);
            //ddlUniversidad.SelectedValue = dtFacultad.Rows[0]["Universidad"].ToString();

            cargarPais();
            ddlPais.SelectedValue = facultad.Ciudad.Estado.IdPais.ToString();

            cargarEstados();
            ddlEstado.SelectedValue = facultad.Ciudad.IdEstado.ToString();

            cargarCiudades();
            ddlCiudad.SelectedValue = facultad.IdCiudad.ToString();

            cargarMaterias();
            List<MateriaFacultad> listFacultad = new List<MateriaFacultad>();
            listFacultad = facultad.MateriaFacultad.ToList();

            foreach (MateriaFacultad materiaFacu in listFacultad)
            {
                LstMaterias.Items.FindByValue(materiaFacu.IdMateria.ToString()).Selected = true;
            }

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

            ddlUniversidad.Items.Insert(0, new ListItem("---------Seleccione Universidad---------", "0"));
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

            ddlEstado.Items.Insert(0, new ListItem("-----------Seleccione Estado----------", "0"));
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

            ddlCiudad.Items.Insert(0, new ListItem("-----------Seleccione Ciudad----------", "0"));
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

        public void modificarFacultad()
        {
            FacultadBLL facultadBLL = new FacultadBLL();

            Facultad oFacultad = new Facultad();

            oFacultad.Id_Facultad = int.Parse(lblIdFacultad.Text);
            oFacultad.Codigo = (txtCodigo.Text).ToUpper();
            oFacultad.Nombre = txtNombre.Text;
            oFacultad.FechaCreacion = Convert.ToDateTime(txtFechaCreacion.Text);
            oFacultad.Universidad = int.Parse(ddlUniversidad.SelectedValue);
            oFacultad.IdCiudad = int.Parse(ddlCiudad.SelectedValue);

            //int Id = int.Parse(lblIdFacultad.Text);
            //string Codigo = (txtCodigo.Text).ToUpper();
            //string Nombre = txtNombre.Text;
            //DateTime FechaCreacion = Convert.ToDateTime(txtFechaCreacion.Text);
            //int Universidad = int.Parse(ddlUniversidad.SelectedValue);
            //int Ciudad = int.Parse(ddlCiudad.SelectedValue);

            MateriaFacultad materiaFacu;
            List<MateriaFacultad> lst = new List<MateriaFacultad>();

            foreach (ListItem item in LstMaterias.Items)
            {
                if (item.Selected)
                {
                    materiaFacu = new MateriaFacultad();
                    materiaFacu.IdMateria = int.Parse(item.Value);
                    materiaFacu.IdFacultad = oFacultad.Id_Facultad;
                    lst.Add(materiaFacu);
                }
            }
            facultadBLL.modificarFacultad(oFacultad, lst);
        }
        #endregion

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Facultad_s.aspx");
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
    }
}