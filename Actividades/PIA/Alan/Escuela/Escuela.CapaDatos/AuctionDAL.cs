using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Escuela.CapaDatos
{
    public class AuctionDAL
    {
        CdisMartEntities oModel;

        public AuctionDAL()
        {
            oModel = new CdisMartEntities();
        }

        public List<object> CargarSubasta()
        {

            var oSubasta = from d in oModel.Auction
                           select new
                           {
                               AuctionId = d.AuctionId,
                               ProductName = d.ProductName,
                               Description = d.Description,
                               StartDate = d.StartDate,
                               EndDate = d.EndDate,
                               HighestBind = d.HighestBind
                           };
            return oSubasta.AsEnumerable<object>().ToList();
        }

        public void AgregarSubasta(Auction oSubasta)
        {
            oModel.Auction.Add(oSubasta);
            oModel.SaveChanges();
        }

        public void ModificarSubasta(Auction pSubasta)
        {
            var oSubasta = (from s in oModel.Auction
                            where s.AuctionId == pSubasta.AuctionId
                            select s).FirstOrDefault();
            if(oSubasta != null)
            {
                oSubasta.ProductName = pSubasta.ProductName;
                oSubasta.Description = pSubasta.Description;
                oSubasta.StartDate = pSubasta.StartDate;
                oSubasta.EndDate = pSubasta.EndDate;
                oSubasta.HighestBind = pSubasta.HighestBind;
            }
            else
            {
                throw new Exception("El objeto viene nulo");
            }

            oModel.SaveChanges();
        }
    }
}
