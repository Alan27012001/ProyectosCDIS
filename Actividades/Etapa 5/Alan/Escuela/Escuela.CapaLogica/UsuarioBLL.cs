using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Escuela.CapaDatos;

namespace Escuela.CapaLogica
{
    public class UsuarioBLL
    {
        public DataTable ConsultarUsuario(string Usuario, string Contrasena)
        {
            UsuarioDAL oUsuario = new UsuarioDAL();
            return oUsuario.ConsultarUsuario(Usuario,Contrasena);
        }
    }
}
