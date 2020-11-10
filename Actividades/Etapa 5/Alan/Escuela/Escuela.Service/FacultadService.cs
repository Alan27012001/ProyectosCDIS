using Escuela.Service.Modelo;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Escuela.Service
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class FacultadService : IFacultad
    {
        public IEnumerable<facultad> Consultar()
        {
            using (MidatabaseEntities contexto = new MidatabaseEntities())
            {
                return contexto.facultad.AsNoTracking().ToList();
            }
        }
    }
}
