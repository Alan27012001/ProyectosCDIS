using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CdisMart.CapaDatos;
using Escuela.CapaDatos;

namespace Escuela.CapaLogica
{
    public class AuctionBLL
    {
        public List<object> CargarSubasta()
        {
            AuctionDAL oAuction = new AuctionDAL();
            return oAuction.CargarSubasta();
        }

        public void AgregarSubasta(Auction oSubasta)
        {
            AuctionDAL oAuction = new AuctionDAL();
            if (oSubasta != null)
            {
                oAuction.AgregarSubasta(oSubasta);
            }
            else
            {
                throw new Exception("La subasta viene Null:(");
            }
        }

        public void ModificarSubasta(Auction pSubasta)
        {
            AuctionDAL auction = new AuctionDAL();
            auction.ModificarSubasta(pSubasta);
        }
    }
}
