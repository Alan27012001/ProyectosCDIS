using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Escuela.CapaDatos;
using System.Data;

namespace Escuela.CapaLogica
{
    public class EstadoBLL
    {
        public DataTable cargarEstadoPorPais(int Pais)
        {
            try
            {
                EstadoDAL oEstado = new EstadoDAL();
                return oEstado.cargarEstadoPorPais(Pais);
            }
            catch (Exception ex)
            {
                throw new Exception("Error" + ex.Message);
            }
        }
    }
}
