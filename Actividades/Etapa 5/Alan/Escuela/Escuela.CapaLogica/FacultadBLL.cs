using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Escuela.CapaDatos;
using System.Transactions;

namespace Escuela.CapaLogica
{
    public class FacultadBLL
    {
        public List<object> CargarFacultades()
        {
            FacultadDAL facultad = new FacultadDAL();
            return facultad.CargarFacultades();
        }
        public void AgregarFacultad(Facultad oFacultad, List<MateriaFacultad> lst)
        {
            FacultadDAL facultad = new FacultadDAL();
            Facultad facu = new Facultad();
            MateriaFacultadBLL oMateria = new MateriaFacultadBLL();
            if (facu == null)
            {
                throw new Exception("La Facultad ya existe en la base de datos");
            }
            else
            {
                if (oFacultad.FechaCreacion.Year > 1900)
                {
                    if (oFacultad.FechaCreacion.Year < 2010)
                    {
                        using (TransactionScope oScope = new TransactionScope())
                        {
                            facultad.AgregarFacultad(oFacultad);

                            foreach (MateriaFacultad materia in lst)
                            {
                                oMateria.AgregarMateriaFacultad(materia);
                            }
                            oScope.Complete();
                        }
                    }
                    else
                    {
                        throw new Exception("Fecha no permitida, introduce una fecha menor a 2010");
                    }
                }
                else
                {
                    throw new Exception("Fecha no permitida, introduce una fecha mayor a 1900");
                }
            }
        }
        public Facultad cargarFacultad(int Id)
        {
            FacultadDAL facultad = new FacultadDAL();
            return facultad.cargarFacultad(Id);
        }
        public void modificarFacultad(Facultad paramFacultad, List<MateriaFacultad> listaFacultad)
        {
            FacultadDAL facultad = new FacultadDAL();
            MateriaFacultadBLL oMateria = new MateriaFacultadBLL();

            using (TransactionScope oScope = new TransactionScope())
            {
                facultad.modificarFacultad(paramFacultad);
                oMateria.EliminarMateria(paramFacultad.Id_Facultad);
                foreach (MateriaFacultad materia in listaFacultad)
                {
                    oMateria.AgregarMateriaFacultad(materia);
                }
                oScope.Complete();
            }
            
        }
        public void eliminarFacultad(int Id)
        {
            FacultadDAL facultad = new FacultadDAL();
            MateriaFacultadBLL oMateriaBLL = new MateriaFacultadBLL();
            using (TransactionScope ts = new TransactionScope())
            {
                oMateriaBLL.EliminarMateria(Id);
                facultad.eliminarFacultad(Id);
                ts.Complete();
            }
            
        }
    }
}
