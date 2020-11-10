using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Escuela.CapaDatos;

namespace Escuela.CapaLogica
{
    public class MateriaBLL
    {
        public List<Materia> cargarMaterias()
        {
            MateriaDAL oMateria = new MateriaDAL();
            return oMateria.cargarMaterias();
        }
    }
}
