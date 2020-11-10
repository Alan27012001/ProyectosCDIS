using System;

namespace Actividad_2
{
    class Program
    {
        public static int opc = 0;
        public static int CantRetiro = 0;
        public static int Retiro = 0;
        public static int contador = 0;
        public static int[] CantidadRetiro; //Array donde se gaurdan los retiros
        public static int[] AcumBillete; //Tambien es Array porque es un acumulado para cada retiro en Billetes
        public static int[] AcumMonedas; //Tambien es Array porque es un acumulado para cada retiro en Monedas

        static void Main(string[] args)
        {
            do
            {
                Menu();
                switch (opc)
                {
                    case 1:
                        Retiros();
                        Menu();
                        break;
                    case 2:
                        MostrarAcumulacion();
                        Menu();
                        break;
                }
            } while (opc != 3);
        }

        public static void Menu()
        {
            Console.Clear();
            Console.ForegroundColor = ConsoleColor.White;
            Console.WriteLine("--------------------------------------Banco CDIS-----------------------------------------");
            Console.WriteLine("1. Ingresar la cantidad de retiros hechos por los usuarios.");
            Console.WriteLine("2. Revisar la cantidad entregada de billetes y monedas");
            Console.WriteLine("\nIngrese la opción:");
            opc = int.Parse(Console.ReadLine());
        }

        public static void Retiros()
        {
            Console.Clear();
            do
            {
                Console.WriteLine("\n¿Cuantos retiros se hicieron (maximo 10)?");
                Retiro = int.Parse(Console.ReadLine());
            } while (Retiro < 0 || Retiro > 10); //El do while solo debe repetirse mientras captura la cantidad de retiros, 
                                                 //es incesario que se repita todo

            CantidadRetiro = new int[Retiro]; //Se inicializa el array con la cantidad de retiros que capturo el usuario
            for (int i = 0; i < Retiro; i++) //Los arrays siempre empiezan en 0, para imprimir el indice (i) usa i+1
            {
                Console.WriteLine("Ingresa la cantidad del retiro #" + (i + 1));
                CantidadRetiro[i] = int.Parse(Console.ReadLine());
                if (CantidadRetiro[i] <= 0 && CantidadRetiro[i] < 50000)
                {
                    Console.WriteLine("Ingresa la cantidad del retiro #" + (i + 1));
                    CantidadRetiro[i] = int.Parse(Console.ReadLine());
                }
            }

            Console.Clear();
        }

        public static void MostrarAcumulacion()
        {
            AcumBillete = new int[Retiro];
            AcumMonedas = new int[Retiro];

            for (int i = 0; i < Retiro; i++) //Los arrays siempre empiezan en 0, para imprimir el indice (i) usa i+1
            {
                int B500, B200, B100, B50, B20, M10, M5, M1;
                B500 = 0;
                B200 = 0;
                B100 = 0;
                B50 = 0;
                B20 = 0;
                M10 = 0;
                M5 = 0;
                M1 = 0;
                if ((CantidadRetiro[i] >= 500))
                {
                    B500 = (CantidadRetiro[i] / 500);
                    CantidadRetiro[i] = CantidadRetiro[i] - (B500 * 500);
                }
                if ((CantidadRetiro[i] >= 200))
                {
                    B200 = (CantidadRetiro[i] / 200);
                    CantidadRetiro[i] = CantidadRetiro[i] - (B200 * 200);
                }
                if ((CantidadRetiro[i] >= 100))
                {
                    B100 = (CantidadRetiro[i] / 100);
                    CantidadRetiro[i] = CantidadRetiro[i] - (B100 * 100);
                }
                if ((CantidadRetiro[i] >= 50))
                {
                    B50 = (CantidadRetiro[i] / 50);
                    CantidadRetiro[i] = CantidadRetiro[i] - (B50 * 50);
                }
                if ((CantidadRetiro[i] >= 20))
                {
                    B20 = (CantidadRetiro[i] / 20);
                    CantidadRetiro[i] = CantidadRetiro[i] - (B20 * 20);
                }
                if ((CantidadRetiro[i] >= 10))
                {
                    M10 = (CantidadRetiro[i] / 10);
                    CantidadRetiro[i] = CantidadRetiro[i] - (M10 * 10);
                }
                if ((CantidadRetiro[i] >= 5))
                {
                    M5 = (CantidadRetiro[i] / 5);
                    CantidadRetiro[i] = CantidadRetiro[i] - (M5 * 5);
                }
                if ((CantidadRetiro[i] >= 1))
                {
                    M1 = (CantidadRetiro[i] / 1);
                    CantidadRetiro[i] = CantidadRetiro[i] - (M1 * 1);
                }
                AcumBillete[i] = B500 + B200 + B100 + B50 + B20;
                AcumMonedas[i] = M10 + M5 + M1;
            }
            Console.Clear();
            //Impresion de los Resultados
            for (int i = 0; i < Retiro; i++)
            {
                Console.Write("\n\nRetiro #" + (i + 1));
                Console.Write("\nBilletes entregados: " + AcumBillete[i]);
                Console.Write("\nMonedas entregadas: " + AcumMonedas[i]);
            }
            Console.WriteLine("\n\nPresione 'enter' para continuar...");
            Console.ReadLine();
        }
    }
}
