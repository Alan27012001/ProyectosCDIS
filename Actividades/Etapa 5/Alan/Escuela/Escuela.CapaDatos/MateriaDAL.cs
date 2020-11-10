using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Escuela.CapaDatos
{
    public class MateriaDAL
    {
        EscuelaEntities oModel;

        public MateriaDAL()
        {
            oModel = new EscuelaEntities();
        }

        public List<Materia> cargarMaterias()
        {
            var oMateria = (from d in oModel.Materia
                           select d).ToList();
            return oMateria;
        }
    }
}
