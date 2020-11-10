using System;

namespace Actividad_4
{
    class Program
    {
        public static string opc = "";
        public static double cantbeca = 0;
        static void Main(string[] args)
        {
            Proceso();
        }
        public static void Proceso()
        {
            Estudiante objEstudiante = new Estudiante();
            EstudiantePosgrado oEstudiantePosgrado = new EstudiantePosgrado();
            EstudianteLicenciatura oEstudianteLicenciatura = new EstudianteLicenciatura();
            try
            { 
                int cantidadArray = 0;
                Console.WriteLine("¿Cuántos estudiantes deseas agregar?");
                cantidadArray = int.Parse(Console.ReadLine());
                Estudiante[] oEstudiante = new Estudiante[cantidadArray];
                Console.Clear();
                for (int i = 0; i < oEstudiante.Length; i++)
                {
                    Console.Clear();
                    Console.Write("\nIngresa la matrícula del estudiante #" + (i + 1) + ": ");
                    objEstudiante.setMatricula(int.Parse(Console.ReadLine()));
                    Console.Write("Ingresa el nombre del estudiante #" + (i + 1) + ": ");
                    objEstudiante.setNombre(Console.ReadLine());
                    Console.Write("Ingresa la edad del estudiante #" + (i + 1) + ": ");
                    objEstudiante.setEdad(int.Parse(Console.ReadLine()));
                    Console.Write("Ingresa la cuota escolar del estudiante #" + (i + 1) + ": ");
                    objEstudiante.setCuotaEscolar(double.Parse(Console.ReadLine()));
                    Console.WriteLine("¿El estudiante es de licencitura(l) o de posgrado(p)?: ");
                    objEstudiante.grado =  Console.ReadLine();
                    if (objEstudiante.grado == "l")
                    {
                        Console.WriteLine("¿El estudiante realiza su servicio social? (Teclear Si o No): ");
                        opc = Console.ReadLine();
                        //oEstudianteLicenciatura.setRealizaServicio(bool.Parse(Console.ReadLine()));
                        if (opc == "Si" || opc == "si")
                        {
                            string beca = "";
                            Console.Write("¿El estudiante cuenta con beca? (Teclear Si o No):");
                            beca = Console.ReadLine();
                            if (beca == "Si" || beca == "si")
                            {
                                Console.Write("Asignar con un numero entero el porcentaje de la beca:");
                                cantbeca = double.Parse(Console.ReadLine());
                                /*objEstudiante.asignarBeca(int.Parse(Console.ReadLine()));*/
                            }
                        }                  
                    }
                    if(objEstudiante.grado == "p")
                    { 
                        Console.Write("Ingresa el Nivel SNI del estudiante: ");
                        oEstudiantePosgrado.setNivelSNI(int.Parse(Console.ReadLine()));
                        string beca = "";
                        Console.Write("¿El estudiante cuenta con beca? (Teclear Si o No):");
                        beca = Console.ReadLine();
                        if (beca == "Si" || beca == "si")
                        {
                            Console.Write("Asignar con un numero entero el porcentaje de la beca:");
                            cantbeca = double.Parse(Console.ReadLine());
                        }
                    }
                    oEstudiante[i] = new Estudiante(objEstudiante.getMatricula(), objEstudiante.getNombre(), objEstudiante.getEdad(), objEstudiante.getPassword(), objEstudiante.getCuotaEscolar(), objEstudiante.grado);
                }
                Console.Clear();
                Console.WriteLine("Estudiantes ingresados: ");
                for (int i = 1; i < oEstudiante.Length; i++)
                {
                    if (oEstudiante[i].grado == null)
                    {
                        Console.WriteLine("\nMatrícula: " + oEstudiante[i].getMatricula());
                        Console.WriteLine("Nombre: " + oEstudiante[i].getNombre());
                        Console.WriteLine("Edad: " + oEstudiante[i].getEdad());
                        Console.WriteLine("Password: " + oEstudiante[i].getPassword());
                        Console.WriteLine("Cuota Escolar: " + oEstudiante[i].getCuotaEscolar());
                        Console.WriteLine("Realiza servicio social: " + opc);
                    }
                    if (oEstudiante[i].grado == null)
                    {
                        Console.WriteLine("\nMatrícula: " + oEstudiante[i].getMatricula());
                        Console.WriteLine("Nombre: " + oEstudiante[i].getNombre());
                        Console.WriteLine("Edad: " + oEstudiante[i].getEdad());
                        Console.WriteLine("Password: " + oEstudiante[i].getPassword());
                        Console.WriteLine("Cuota Escolar: " + oEstudiante[i].getCuotaEscolar());
                        Console.WriteLine("Nivel SNI: " + oEstudiantePosgrado.getNivelSNI());
                    }
                }
                Console.ReadKey();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }        
        }
    }
}
