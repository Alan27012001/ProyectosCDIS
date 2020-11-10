using System;

namespace Actividad_4
{
    public class Estudiante
    {
        protected int Matricula { get; set; }
        public int getMatricula() { return Matricula; }
        public void setMatricula(int matricula) { Matricula = matricula; }

        protected string Nombre { get; set; }
        public string getNombre() { return Nombre; }
        public void setNombre(string nombre) { Nombre = nombre; }

        protected int Edad { get; set; }
        public int getEdad() { return Edad; }
        public void setEdad(int edad) { Edad = edad; }

        protected string Password { get; set; }
        public string getPassword() { return Password; }
        public void setPassword(string password) { Password = password; }

        protected double CuotaEscolar { get; set; }
        public double getCuotaEscolar() { return CuotaEscolar; }
        public void setCuotaEscolar(double cuotaescolar) { CuotaEscolar = cuotaescolar; }

        public string grado { get; set; }

        public Estudiante()
        {
            CuotaEscolar = 0;
        }

        public Estudiante(string grado)
        {
            this.grado = grado;
        }

        public Estudiante(int Matricula, string Nombre, int Edad, string Password, double CuotaEscolar,string grado)
        {
            mostrarDatos(Matricula, Nombre, Edad, Password,CuotaEscolar, grado);
        }

        public void asignarEdad(int edad)
        {
            if (edad >= 15 && edad <= 90)
                this.Edad = edad;
            if (edad < 15)
                this.Edad = 15;
            if (edad > 90)
                this.Edad = 90;
        }

        public void asignarPassword(string contraseniaAleatoria)
        {
            Random rdn = new Random();
            string caracteres = "abcdefghijklmnopqrstuvwxyz1234567890";
            int longitud = caracteres.Length;
            char letra;
            int longitudContrasenia = 8;
            contraseniaAleatoria = string.Empty;
            for (int i = 0; i < longitudContrasenia; i++)
            {
                letra = caracteres[rdn.Next(longitud)];
                contraseniaAleatoria += letra.ToString();
            }
            this.Password = contraseniaAleatoria;
        }

        public virtual void asignarBeca(double Porcentaje)
        {
            this.CuotaEscolar = (Porcentaje * CuotaEscolar)-CuotaEscolar;
        }

        public virtual void mostrarDatos(int Matricula, string Nombre, int Edad, string Password, double CuotaEscolar, string grado)
        {
            this.Matricula = Matricula;
            this.Nombre = Nombre;
            asignarEdad(Edad);
            asignarPassword(Password);
            asignarBeca(CuotaEscolar);
        }
    }
}
