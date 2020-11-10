using CdisMart.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CdisMart.CapaLogica;
using CdisMart.CapaDatos;
using Escuela.CapaDatos;
using Escuela.CapaLogica;

namespace Escuela
{
    public partial class NuevaSubasta : ClaseTema, IAcceso
    {
        public bool SessionIniciada()
        {
            throw new NotImplementedException();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void AgregarSubasta()
        {
            AuctionDAL oAuctionDal = new AuctionDAL();
            AuctionBLL oAuctionBll = new AuctionBLL();
            Auction oAuction = new Auction();

            oAuction.ProductName = txtNombreProducto.Text;
            oAuction.Description = txtDescripcionProducto.Text;
            oAuction.StartDate = Convert.ToDateTime(txtFechaInicio.Text);
            oAuction.EndDate = Convert.ToDateTime(txtFechaFin.Text);

            try
            {
                oAuctionBll.AgregarSubasta(oAuction);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('" + ex.Message + "');", true);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarSubasta();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alta", "alert('Subasta Agregada Exitosamente);", true);
        }
    }
}