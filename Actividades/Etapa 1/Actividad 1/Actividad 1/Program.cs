using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Actividad_1
{
    class Program
    {
        public static int altura = 0;
        static void Main(string[] args)
        {
            /*
            1. Escribe un programa que imprima en consola una figura en forma de pirámide, utilizando hashtags (#) como
                los bloques de la pirámide.
            2. Deberás preguntar al usuario la altura de la pirámide; deberá ser un valor entero no negativo que no sea
                mayor a 25.
            3. Si el usuario provee un valor que no cumpla con el requerimiento anterior, el programa deberá solicitar la
                altura de nuevo.
            4. Con la altura indicada, el programa deberá imprimir la pirámide en la consola.
            5. En cada fila de la pirámide deberás considerar:
                o Imprimir una cantidad determinada de espacios (“ ”);
                o Imprimir una cantidad determinada de hashtags (#);
             */
            //Proceso
            do
            {
                Console.Write("Altura: ");
                altura = int.Parse(Console.ReadLine());
                if (altura >= 0 && altura <= 25)
                {
                    Piramide();
                }
            } while (altura < 0 || altura > 25);
            //Salida
            Console.ReadKey();
        }

        public static void Piramide()
        {
            //Determina el tamaño de la Piramide
            for (int i = altura; i >= 0; i--)
            {
                //Asignacion de Espacios
                for (int b = 0; b < i; b++)
                {
                    Console.Write(" ");
                }
                //Asignacion de Caracteres
                for (int d = i; d < altura; d++)
                {
                    Console.Write("#");
                }
                Console.WriteLine();
            }
        }
    }
}
