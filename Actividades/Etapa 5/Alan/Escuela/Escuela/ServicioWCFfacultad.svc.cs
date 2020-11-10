using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using Escuela.CapaDatos;
using System.Web.Script.Serialization;

namespace Escuela
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class ServicioWCFfacultad
    {
        EscuelaEntities oModel;

        public ServicioWCFfacultad()
        {
            oModel = new EscuelaEntities();
        }

        [ServiceContract]
        public interface IFacultad
        {
            [OperationContract]
            IEnumerable<Facultad> ConsultarFacultadWCF();
        }



        [WebGet]
        [OperationContract]
        public string ConsultaFacultadJSON()
        {
            var oFacultad = from d in oModel.Facultad
                            select new
                            {
                                Id_Facultad = d.Id_Facultad,
                                Codigo = d.Codigo,
                                Nombre = d.Nombre,
                                FechaCreacion = d.FechaCreacion
                            };
            return (new JavaScriptSerializer().Serialize(oFacultad.AsEnumerable<object>().ToList()));
        }
    }
}
