using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.InteropServices.ComTypes;
using Escuela.CapaDatos;

namespace CdisMart.CapaDatos
{
    public class UsuarioDAL
    {
        CdisMartEntities oModel;

        public UsuarioDAL()
        {
            oModel = new CdisMartEntities();
        }


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

        public List<object> ListarUsuarios()
        {
            var oUsuario = from d in oModel.User
                           select new
                           {
                               UserId = d.UserId,
                               UserName = d.UserName,
                               Password = d.Password,
                               Name = d.Name,
                               Email = d.Email
                           };
            return oUsuario.AsEnumerable<object>().ToList();
        }

        public void AgregarUsuario(User oUsuario)
        {
            oModel.User.Add(oUsuario);
            oModel.SaveChanges();
        }

        public void AgregarUsuario(Usuario oUsuario)
        {
            SqlConnection conexion = null;
            try
            {
                conexion = Conexion.getInstance().ConexionDB();
                SqlCommand command = new SqlCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "sp_agregarUsuario";
                command.Connection = conexion;

                command.Parameters.AddWithValue("pId", oUsuario.Id);
                command.Parameters.AddWithValue("pNombre", oUsuario.Nombre);
                command.Parameters.AddWithValue("pAPaterno", oUsuario.APaterno);
                command.Parameters.AddWithValue("pAMaterno", oUsuario.AMaterno);
                command.Parameters.AddWithValue("pDireccion", oUsuario.Direccion);
                command.Parameters.AddWithValue("pTelefono", oUsuario.Telefono);

                conexion.Open();

                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error" + ex.Message);
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}
