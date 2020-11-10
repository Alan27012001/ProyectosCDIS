using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Escuela.CapaDatos;

namespace Escuela.CapaLogica
{
    public class MateriaFacultadBLL
    {
        public void AgregarMateriaFacultad(MateriaFacultad oMateria)
        {
            MateriaFacultadDAL mtFacultad = new MateriaFacultadDAL();
            mtFacultad.AgregarMateriaFacultad(oMateria);
        }

        public void EliminarMateria(int Id)
        {
            MateriaFacultadDAL oMateria = new MateriaFacultadDAL();
            oMateria.EliminarMateria(Id);
        }
    }
}
