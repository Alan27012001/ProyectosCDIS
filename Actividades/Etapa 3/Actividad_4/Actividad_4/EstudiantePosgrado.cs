using System;

namespace Actividad_4
{
    public class EstudiantePosgrado : Estudiante
    {
        public int NivelSNI { get; set; }
        public int getNivelSNI() { return NivelSNI; }
        public void setNivelSNI(int nivelSNI) { NivelSNI = nivelSNI; }

        public EstudiantePosgrado()
        {
            NivelSNI = 0;
        }

        public EstudiantePosgrado(int Matricula, string Nombre, int Edad, string Password, double CuotaEscolar, string grado,int NivelSNI) : base(Matricula, Nombre, Edad, Password,CuotaEscolar, grado)
        {
            comprobarNivelSNI(NivelSNI);
        }

        public void comprobarNivelSNI(int ValidacionNum)
        {
            if (ValidacionNum >= 0 && ValidacionNum <= 3)
                this.NivelSNI = NivelSNI;
        }
        public override void asignarBeca(double Porcentaje)
        {
            if (NivelSNI == 1 || NivelSNI == 2)
                this.CuotaEscolar = (CuotaEscolar * Porcentaje) - CuotaEscolar;
            if (this.NivelSNI == 3)
                this.CuotaEscolar = (CuotaEscolar * .30) - CuotaEscolar;
            this.CuotaEscolar = Porcentaje;
        }

        public override void mostrarDatos(int Matricula, string Nombre, int Edad, string Password, double CuotaEscolar, string grado)//, int NivelSNI
        {
            this.Matricula = Matricula;
            this.Nombre = Nombre;
            asignarEdad(Edad);
            asignarPassword(Password);
            asignarBeca(CuotaEscolar);
            comprobarNivelSNI(NivelSNI);
        }
    }
}
