using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CdisMart.Web;
using Escuela.CapaLogica;

namespace Escuela
{
    public partial class ListarSubasta : ClaseTema,IAcceso
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grd_Subastas.DataSource = CargarSubasta();
                grd_Subastas.DataBind();
            }
        }

        public List<object> CargarSubasta()
        {
            AuctionBLL auctionbll = new AuctionBLL();
            List<object> lst = new List<object>();

            lst = auctionbll.CargarSubasta();
            return lst;
        }

        public bool SessionIniciada()
        {
            throw new NotImplementedException();
        }

        protected void grd_Subastas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Informacion")
            {
                Response.Redirect("~/Subasta.aspx?pSubastaId=" + e.CommandArgument);
            }
        }
    }
}