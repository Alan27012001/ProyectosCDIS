using System;

namespace Actividad_3
{
    public class Estudiante
    {
        private int _matricula { get; set; }
        public int getMatricula() { return _matricula; }
        public void setMatricula(int matricula) { _matricula = matricula; } 


        private string _nombre { get; set; }
        public string getNombre() { return _nombre; }
        public void setNombre(string nombre) { _nombre = nombre; }

        private int _edad { get; set; }
        public int getEdad() { return _edad; }
        public void setEdad(int edad) { _edad = edad; }

        private string _password { get; set; }
        public string getPassword() { return _password; }
        public void setPassword(string password) { _password = password; }

        public Estudiante()
        {

        }

        public Estudiante(int _matricula, string _nombre, int _edad, string _password)
        {
            mostrarDatos(_matricula,_nombre,_edad, _password);
        }

        public void asignarEdad(int edad)
        {
            if (edad >= 15 && edad <= 90)
                this._edad = edad;
            if (edad < 15)
                this._edad = 15;
            if (edad > 90)
                this._edad = 90;
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
            this._password = contraseniaAleatoria;
        }

        public void mostrarDatos(int _matricula, string _nombre, int _edad, string _password)
        {
            this._matricula = _matricula;
            this._nombre = _nombre;
            asignarEdad(_edad);
            asignarPassword(_password);
        }
    }
}
