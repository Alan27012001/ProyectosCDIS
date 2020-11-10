using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Escuela.CapaDatos
{
    public class FacultadDAL
    {
        EscuelaEntities oModel;

        public FacultadDAL()
        {
            oModel = new EscuelaEntities();
        }

        public List<object> CargarFacultades()
        {
            #region "Con Stored Pocedure"

            //SqlConnection conexion = null;
            //try
            //{
            //    conexion = Conexion.getInstance().ConexionDB();
            //    SqlCommand command = new SqlCommand();
            //    command.CommandType = CommandType.StoredProcedure;
            //    command.CommandText = "sp_cargarFacultades";
            //    command.Connection = conexion;

            //    SqlDataAdapter adapter = new SqlDataAdapter();
            //    DataTable dtfacultad = new DataTable();

            //    conexion.Open();

            //    adapter.SelectCommand = command;
            //    adapter.Fill(dtfacultad);

            //    return dtfacultad;
            //}
            //catch (Exception ex)
            //{
            //    throw new Exception("Error" + ex.Message);
            //}
            //finally
            //{
            //    conexion.Close();
            //}       
            #endregion

            var oFacultad = from d in oModel.Facultad
                           select new
                           {
                               Id_Facultad = d.Id_Facultad,
                               Codigo = d.Codigo,
                               Nombre  = d.Nombre,
                               FechaCreacion = d.FechaCreacion,
                               NombreUniversidad =  d.Universidad1.Nombre,
                               NombreCiudad =  d.Ciudad.Nombre
                           };

            return oFacultad.AsEnumerable<object>().ToList();
        }

        public void AgregarFacultad(Facultad oFacultad)
        {
            #region "Con Stored Procedure"
            //SqlConnection conexion = null;
            //try
            //{
            //    conexion = Conexion.getInstance().ConexionDB();              
            //    SqlCommand command = new SqlCommand();
            //    command.CommandType = CommandType.StoredProcedure;
            //    command.CommandText = "sp_agregarfacultad";
            //    command.Connection = conexion;

            //    command.Parameters.AddWithValue("pCodigo", Codigo);
            //    command.Parameters.AddWithValue("pNombre", Nombre);
            //    command.Parameters.AddWithValue("pFechaCreacion", FechaCreacion);
            //    command.Parameters.AddWithValue("pUniversidad", Universidad);
            //    command.Parameters.AddWithValue("pCiudad", Ciudad);

            //    conexion.Open();

            //    command.ExecuteNonQuery();
            //}
            //catch (Exception ex)
            //{
            //    throw new Exception("Error" + ex.Message);
            //}
            //finally
            //{
            //    conexion.Close();
            //}
            #endregion

            oModel.Facultad.Add(oFacultad);
            oModel.SaveChanges();
        }

        public Facultad cargarFacultad(int Id)
        {
            #region "Con Stored Procedure"
            //SqlConnection conexion = null;
            //try
            //{
            //    conexion = Conexion.getInstance().ConexionDB();
            //    SqlCommand command = new SqlCommand();
            //    command.CommandType = CommandType.StoredProcedure;
            //    command.CommandText = "sp_cargarFacultadPorId";
            //    command.Connection = conexion;

            //    command.Parameters.AddWithValue("pIdFacultad", Id);

            //    SqlDataAdapter adapter = new SqlDataAdapter();
            //    DataTable dtFacultad = new DataTable();

            //    conexion.Open();

            //    adapter.SelectCommand = command;
            //    adapter.Fill(dtFacultad);
            //    return dtFacultad;
            //}
            //catch (Exception ex)
            //{
            //    throw new Exception("Error" + ex.Message);
            //}
            //finally
            //{
            //    conexion.Close();
            //}
            #endregion

            var oFacultad = (from d in oModel.Facultad
                            where d.Id_Facultad == Id
                            select d).FirstOrDefault();
            return oFacultad;
        }

        public void modificarFacultad(Facultad pFacultad)
        {
            #region "Con Stored Procedure"
            //SqlConnection connection = null;
            //try
            //{
            //    connection = Conexion.getInstance().ConexionDB();
            //    SqlCommand command = new SqlCommand();
            //    command.CommandType = CommandType.StoredProcedure;
            //    command.CommandText = "sp_modificarfacultad";
            //    command.Connection = connection;

            //    command.Parameters.AddWithValue("pIdFacultad", Id);
            //    command.Parameters.AddWithValue("pCodigo", Codigo);
            //    command.Parameters.AddWithValue("pNombre", Nombre);
            //    command.Parameters.AddWithValue("pFechaCreacion", FechaCreacion);
            //    command.Parameters.AddWithValue("pUniversidad", Universidad);
            //    command.Parameters.AddWithValue("pCiudad", Ciudad);

            //    connection.Open();

            //    command.ExecuteNonQuery();
            //}
            //catch (Exception ex)
            //{
            //    throw new Exception("Error" + ex.Message);
            //}
            //finally
            //{
            //    connection.Close();
            //}
            #endregion

            var oFacultad = (from d in oModel.Facultad
                             where d.Id_Facultad == pFacultad.Id_Facultad
                             select d).FirstOrDefault();
            oFacultad.Codigo = pFacultad.Codigo;
            oFacultad.Nombre = pFacultad.Nombre;
            oFacultad.FechaCreacion = pFacultad.FechaCreacion;
            oFacultad.Universidad = pFacultad.Universidad;
            oFacultad.Ciudad = pFacultad.Ciudad;

            oModel.SaveChanges();

        }

        public void eliminarFacultad(int Id)
        {
            #region "Con Stored Procedure"
            //SqlConnection connection = null;
            //try
            //{
            //    connection = Conexion.getInstance().ConexionDB();
            //    SqlCommand command = new SqlCommand();
            //    command.CommandType = CommandType.StoredProcedure;
            //    command.CommandText = "sp_eliminarfacultad";
            //    command.Connection = connection;
            //    command.Parameters.AddWithValue("pIdFacultad", Id);
            //    connection.Open();
            //    command.ExecuteNonQuery();
            //}
            //catch (Exception ex)
            //{
            //    throw new Exception("Error" + ex.Message);
            //}
            //finally
            //{
            //    connection.Close();
            //}
            #endregion

            var oFacultad = (from d in oModel.Facultad
                             where d.Id_Facultad == Id
                             select d).FirstOrDefault();
            oModel.Facultad.Remove(oFacultad);
            oModel.SaveChanges();
        }
    }
}
