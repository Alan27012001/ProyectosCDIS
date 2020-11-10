using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Escuela.CapaDatos
{
    public class UsuarioDAL
    {
        public DataTable ConsultarUsuario(string Usuario, string Contrasena)
        {
            SqlConnection connection = null;
            try
            {
                connection = Conexion.getInstance().ConexionDB();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_consultarUsuario";
                cmd.Connection = connection;

                cmd.Parameters.AddWithValue("pNombre",Usuario);
                cmd.Parameters.AddWithValue("pContrasena",Contrasena);

                SqlDataAdapter adapter = new SqlDataAdapter();
                DataTable dtUsuario = new DataTable();

                connection.Open();
                adapter.SelectCommand = cmd;
                adapter.Fill(dtUsuario);

                return dtUsuario;

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
