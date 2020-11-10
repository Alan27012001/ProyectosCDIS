using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Escuela.CapaDatos
{
    public class UniversidadDAL
    {
        EscuelaEntities oModel;

        public UniversidadDAL()
        {
            oModel = new EscuelaEntities();
        }

        public List<Universidad> cargarUniversidad()
        {
            #region "Con Stored Procedure"
            //SqlConnection connection = null;
            //try
            //{
            //    connection = Conexion.getInstance().ConexionDB();
            //    SqlCommand command = new SqlCommand();
            //    command.CommandType = CommandType.StoredProcedure;
            //    command.CommandText = "sp_cargarUniversidades";
            //    command.Connection = connection;

            //    SqlDataAdapter adapter = new SqlDataAdapter();
            //    DataTable dtUniversidad = new DataTable();

            //    connection.Open();

            //    adapter.SelectCommand = command;
            //    adapter.Fill(dtUniversidad);
            //    return dtUniversidad;
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

            var oUniversidad = (from d in oModel.Universidad
                               select d).ToList();

            return oUniversidad;
        }
    }
}
