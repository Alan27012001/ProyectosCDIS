using System;

namespace Actividad_3
{
    class Program
    {
        static void Main(string[] args)
        {
            Proceso();
        }
        public static void Proceso()
        {
            Estudiante objEstudiante = new Estudiante();
            int cantidadArray = 0;
            Console.WriteLine("¿Cuántos estudiantes deseas agregar?");
            cantidadArray = int.Parse(Console.ReadLine());
            Estudiante[] oEstudiante = new Estudiante[cantidadArray];
            for (int i = 0; i < oEstudiante.Length; i++)
            {
                Console.Write("\nIngresa la matrícula del estudiante #" + (i + 1) + ":");
                objEstudiante.setMatricula(int.Parse(Console.ReadLine()));
                Console.Write("Ingresa el nombre del estudiante #" + (i + 1) + ":");
                objEstudiante.setNombre(Console.ReadLine());
                Console.Write("Ingresa la edad del estudiante #" + (i + 1) + ":");
                objEstudiante.setEdad(int.Parse(Console.ReadLine()));
                oEstudiante[i] = new Estudiante(objEstudiante.getMatricula(), objEstudiante.getNombre(), objEstudiante.getEdad(), objEstudiante.getPassword());
            }
            Console.Clear();
            Console.WriteLine("Estudiantes ingresados: ");
            for (int i = 0; i < oEstudiante.Length; i++)
            {
                Console.WriteLine("\nMatrícula: " + oEstudiante[i].getMatricula());
                Console.WriteLine("Nombre: " + oEstudiante[i].getNombre());
                Console.WriteLine("Edad: " + oEstudiante[i].getEdad());
                Console.WriteLine("Password: " + oEstudiante[i].getPassword());
            }
            Console.ReadKey();
        }
    }
}
