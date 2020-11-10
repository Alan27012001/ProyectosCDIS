using System;

namespace Actividad_4
{
    public class EstudianteLicenciatura : Estudiante
    {
        public bool RealizaServicio { get; set; }
        public bool getRealizaServicio() { return RealizaServicio; }
        public void setRealizaServicio(bool realizaservicio) { RealizaServicio = realizaservicio; }

        public EstudianteLicenciatura()
        {
            RealizaServicio = false;
        }

        public EstudianteLicenciatura(int Matricula, string Nombre, int Edad, string Password, double CuotaEscolar, string grado, bool RealizaServicio) : base(Matricula,Nombre,Edad,Password, CuotaEscolar, grado)
        {
            this.RealizaServicio = RealizaServicio;
        }

        public override void asignarBeca(double Porcentaje)
        {
            CuotaEscolar = (CuotaEscolar * .15) - CuotaEscolar;
            this.CuotaEscolar = Porcentaje;
        }

        public override void mostrarDatos(int Matricula, string Nombre, int Edad, string Password, double CuotaEscolar, string grado)// bool RealizaServicio
        {
            this.Matricula = Matricula;
            this.Nombre = Nombre;
            asignarEdad(Edad);
            asignarPassword(Password);
            asignarBeca(CuotaEscolar);
            //this.RealizaServicio = RealizaServicio;
        }
    }
}
