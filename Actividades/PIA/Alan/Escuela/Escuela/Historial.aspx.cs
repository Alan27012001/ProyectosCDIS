using CdisMart.Web;
using Escuela.CapaLogica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CdisMart.CapaDatos;

namespace Escuela
{
    public partial class Historial : ClaseTema, IAcceso
    {
        public bool SessionIniciada()
        {
            throw new NotImplementedException();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}