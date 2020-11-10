using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Escuela.CapaDatos;

namespace Escuela.CapaLogica
{
    public class PaisBLL
    {
        public DataTable cargarPais()
        {
            try
            {
                PaisDAL oPais = new PaisDAL();
                return oPais.cargarPais();
            }
            catch (Exception ex)
            {
                throw new Exception("Error" + ex.Message);
            }
        }
    }
}
