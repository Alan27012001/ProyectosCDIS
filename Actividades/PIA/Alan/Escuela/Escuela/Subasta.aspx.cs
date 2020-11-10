using CdisMart.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CdisMart.CapaDatos;
using CdisMart.CapaLogica;
using Escuela.CapaLogica;
using Escuela.CapaDatos;

namespace Escuela
{
    public partial class Subasta : ClaseTema, IAcceso
    {
        public bool SessionIniciada()
        {
            throw new NotImplementedException();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["pSubastaId"]);
                cargarSubastaPorId(id);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            ModificarSubasta();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Modificacion", "alert('Subasta Modificada exitosamente');", true);
        }

        public void cargarSubastaPorId(int SubastaId)
        {
            SqlConnection conn = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter ad = new SqlDataAdapter();
            DataTable dtSubasta = new DataTable();
            try
            {
                conn = Conexion.getInstance().ConexionDB();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_CargarSubastaPorId";
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("pSubastaId", SubastaId);

                conn.Open();

                ad.SelectCommand = cmd;
                ad.Fill(dtSubasta);

                /*          CARGA DE DATOS      */

                /*Subasta Anterior*/
                txtIdSubasta.Text = dtSubasta.Rows[0]["AuctionId"].ToString();
                txtNombreProducto.Text = dtSubasta.Rows[0]["ProductName"].ToString();
                txtDescripcionProducto.Text = dtSubasta.Rows[0]["Description"].ToString();
                txtFechaInicio.Text = dtSubasta.Rows[0]["StartDate"].ToString();
                txtFechaFin.Text = dtSubasta.Rows[0]["EndDate"].ToString();
                txtOfertaMasAlta.Text = dtSubasta.Rows[0]["HighestBind"].ToString();

                /*Nueva Subasta*/
                txtNuevoNombreProducto.Text = dtSubasta.Rows[0]["ProductName"].ToString();
                txtNuevoDescripcionProducto.Text = dtSubasta.Rows[0]["Description"].ToString();
                txtNuevoFechaInicio.Text = dtSubasta.Rows[0]["StartDate"].ToString();
                txtNuevoFechaFin.Text = dtSubasta.Rows[0]["EndDate"].ToString();
                txtNuevoOfertaAlta.Text = dtSubasta.Rows[0]["HighestBind"].ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        public void ModificarSubasta()
        {
            AuctionBLL oAuctionBll = new AuctionBLL();

            Auction oSubasta = new Auction();

            oSubasta.ProductName = txtNuevoNombreProducto.Text;
            oSubasta.Description = txtNuevoDescripcionProducto.Text;
            oSubasta.StartDate = Convert.ToDateTime(txtNuevoFechaInicio.Text);
            oSubasta.EndDate = Convert.ToDateTime(txtNuevoFechaFin.Text);
            oSubasta.HighestBind = Convert.ToDecimal(txtNuevoOfertaAlta.Text);

            oAuctionBll.ModificarSubasta(oSubasta);

        }
    }
}