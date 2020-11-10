using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Escuela.CapaDatos
{
    public class EstadoDAL
    {
        public DataTable cargarEstadoPorPais(int Pais)
        {
            SqlConnection connection = null;
            try
            {
                connection = Conexion.getInstance().ConexionDB();
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "sp_cargarEstadosPorPais";
                command.Connection = connection;

                command.Parameters.AddWithValue("pPais", Pais);

                SqlDataAdapter adapter = new SqlDataAdapter();
                DataTable dtEstados = new DataTable();
                connection.Open();

                adapter.SelectCommand = command;
                adapter.Fill(dtEstados);

                return dtEstados;
            
            }
            catch (Exception ex)
            {
                throw new Exception("Error"+ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
