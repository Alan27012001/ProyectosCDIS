using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Escuela.CapaDatos
{
    public class CiudadDAL
    {
        public DataTable cargarCiudadesPorEstado(int Estado)
        {
            SqlConnection connection = null;
            try
            {
                connection = Conexion.getInstance().ConexionDB();
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "sp_cargarCiudadesPorEstado";
                command.Connection = connection;

                command.Parameters.AddWithValue("pEstado", Estado);

                SqlDataAdapter adapter = new SqlDataAdapter();
                DataTable dtCiudad = new DataTable();
                connection.Open();

                adapter.SelectCommand = command;
                adapter.Fill(dtCiudad);

                return dtCiudad;

            }
            catch (Exception ex)
            {
                throw new Exception("Error" + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
