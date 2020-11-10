using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Escuela_DAL;
using System.Data;

namespace Escuela_BLL
{
    public class AlumnoBLL
    {
        public DataTable cargarAlumnos()
        {
            AlumnoDAL alumno = new AlumnoDAL();
            return alumno.CargarAlumnos();
        }
        public void AgregarAlumno(int Matricula, string Nombre, DateTime FechaNacimiento, int Semestre, int Facultad)
        {
            AlumnoDAL alumno = new AlumnoDAL();
            alumno.AgregarAlumno(Matricula, Nombre, FechaNacimiento, Semestre,Facultad);
        }
        public DataTable cargarAlumno(int Matricula)
        {
            AlumnoDAL alumno = new AlumnoDAL();
            return alumno.cargarAlumno(Matricula);
        }
        public void modificarAlumno(int Matricula, string Nombre, DateTime FechaNacimiento, int Semestre, int Facultad)
        {
            AlumnoDAL alumno = new AlumnoDAL();
            alumno.modificarAlumno(Matricula, Nombre, FechaNacimiento, Semestre, Facultad);
        }
        public void eliminarAlumno(int Matricula)
        {
            AlumnoDAL alumno = new AlumnoDAL();
            alumno.eliminarAlumno(Matricula);
        }
    }
}
