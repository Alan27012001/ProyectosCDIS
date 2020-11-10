using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Escuela.CapaDatos
{
    public class MateriaFacultadDAL
    {
        EscuelaEntities oModel;

        public MateriaFacultadDAL()
        {
            oModel = new EscuelaEntities();
        }

        public void AgregarMateriaFacultad(MateriaFacultad oMateria)
        {
            oModel.MateriaFacultad.Add(oMateria);
            oModel.SaveChanges();
        }

        public void EliminarMateria(int Id)
        {
            var oMateria = from d in oModel.MateriaFacultad
                           where d.IdFacultad == Id
                           select d;
            foreach (MateriaFacultad materia in oMateria)
            {
                oModel.MateriaFacultad.Remove(materia);
                oModel.SaveChanges();
            }
        }
    }
}
