using System;
using System.Data.SqlClient;

namespace CdisMart.CapaDatos
{
    public class Conexion
    {
        #region PATRON SINGLETON
        private static Conexion oConexion = null ;
        public Conexion() { }
        public static Conexion getInstance()
        {
            if(oConexion == null)
            {
                oConexion = new Conexion();
            }
            return oConexion;
        }
        #endregion

        #region "Conexion"
        public SqlConnection ConexionDB()
        {
            try
            {
                var conexion = new SqlConnection();
                conexion.ConnectionString = @"Data Source = DESKTOP-GNP26JF; Initial Catalog = CdisMart; Integrated Security = True;";
                return conexion;
            }
            catch (Exception ex)
            {
                throw new Exception("Conexion Invalida" + ex.Message);
            }
        }
        #endregion
    }
}
