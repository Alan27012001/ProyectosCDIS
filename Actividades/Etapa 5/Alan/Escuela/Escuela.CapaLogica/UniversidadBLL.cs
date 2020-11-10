using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Escuela.CapaDatos;

namespace Escuela.CapaLogica
{
    public class UniversidadBLL
    {
        public List<Universidad> cargarUniversidad()
        {
            UniversidadDAL universidad = new UniversidadDAL();
            return universidad.cargarUniversidad();
        }
    }
}
