using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Escuela_DAL
{
    public class AlumnoDAL
    {
        public DataTable CargarAlumnos()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source = DESKTOP-GNP26JF; Initial Catalog = Escuela; Integrated Security = True;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_cargarAlumnos";
            command.Connection = connection;

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable dtAlumnos = new DataTable();

            connection.Open();

            adapter.SelectCommand = command;
            adapter.Fill(dtAlumnos);

            connection.Close();

            return dtAlumnos;
        }

        public void AgregarAlumno(int Matricula, string Nombre, DateTime FechaNacimiento, int Semestre, int Facultad)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source = DESKTOP-GNP26JF; Initial Catalog = Escuela; Integrated Security = True;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_agregarAlumno";
            command.Connection = connection;

            command.Parameters.AddWithValue("pMatricula", Matricula);
            command.Parameters.AddWithValue("pNombre", Nombre);
            command.Parameters.AddWithValue("pFecha", FechaNacimiento);
            command.Parameters.AddWithValue("pSemestre", Semestre);
            command.Parameters.AddWithValue("pFacultad", Facultad);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }

        public DataTable cargarAlumno(int Matricula)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source = DESKTOP-GNP26JF; Initial Catalog = Escuela; Integrated Security = True;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_cargarAlumnoPorMtricula";
            command.Connection = connection;

            command.Parameters.AddWithValue("pMatricula", Matricula);

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable dtAlumno = new DataTable();

            connection.Open();

            adapter.SelectCommand = command;
            adapter.Fill(dtAlumno);

            connection.Close();

            return dtAlumno;
        }

        public void modificarAlumno(int Matricula, string Nombre, DateTime FechaNacimiento, int Semestre, int Facultad)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source = DESKTOP-GNP26JF; Initial Catalog = Escuela; Integrated Security = True;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_modificarAlumno";
            command.Connection = connection;

            command.Parameters.AddWithValue("pMatricula", Matricula);
            command.Parameters.AddWithValue("pNombre", Nombre);
            command.Parameters.AddWithValue("pFecha", FechaNacimiento);
            command.Parameters.AddWithValue("pSemestre", Semestre);
            command.Parameters.AddWithValue("pFacultad", Facultad);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }

        public void eliminarAlumno(int Matricula)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Data Source = DESKTOP-GNP26JF; Initial Catalog = Escuela; Integrated Security = True;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_eliminarAlumno";
            command.Connection = connection;

            command.Parameters.AddWithValue("pMatricula", Matricula);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }
    }
}
