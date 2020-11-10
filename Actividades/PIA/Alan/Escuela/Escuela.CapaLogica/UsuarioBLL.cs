using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CdisMart.CapaDatos;
using Escuela.CapaDatos;

namespace CdisMart.CapaLogica
{
    public class UsuarioBLL
    {
        public DataTable ConsultarUsuario(string Usuario, string Contrasena)
        {
            UsuarioDAL oUsuario = new UsuarioDAL();
            return oUsuario.ConsultarUsuario(Usuario, Contrasena);
        }
        public List<object> ListarUsuarios()
        {
            UsuarioDAL oUsuario = new UsuarioDAL();
            return oUsuario.ListarUsuarios();
        }

        public void AgregarUsuario(User oUsuario)
        {
            UsuarioDAL oUser = new UsuarioDAL();
            if (oUsuario != null)
            {
                oUser.AgregarUsuario(oUsuario);
            }
            else
            {
                throw new Exception("El oUsuario viene Null:(");
            }
        }

        //public void AgregarUsuario(Usuario oUsuario)
        //{
        //    UsuarioDAL usuario = new UsuarioDAL();
        //    if (oUsuario != null)
        //    {
        //        usuario.AgregarUsuario(oUsuario);
        //    }
        //    else
        //    {
        //        throw new Exception("El oUsuario viene Null:(");
        //    }
        //}
    }
}
