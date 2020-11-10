using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Escuela.CapaDatos
{
    public class PaisDAL
    {
        public DataTable cargarPais()
        {
            SqlConnection connection = null;
            try
            {
                connection = Conexion.getInstance().ConexionDB();
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "sp_cargarPais";
                command.Connection = connection;

                SqlDataAdapter adapter = new SqlDataAdapter();
                DataTable dtPais = new DataTable();
                connection.Open();

                adapter.SelectCommand = command;
                adapter.Fill(dtPais);

                return dtPais;

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
