using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Escuela.CapaDatos;
using System.Data;

namespace Escuela.CapaLogica
{
    public class CiudadBLL
    {
        public DataTable cargarCiudadesPorEstado(int Estado)
        {
            try
            {
                CiudadDAL oCiudad = new CiudadDAL();
                return oCiudad.cargarCiudadesPorEstado(Estado);
            }
            catch (Exception ex)
            {
                throw new Exception("Error" + ex.Message);
            }
        }
    }
}
