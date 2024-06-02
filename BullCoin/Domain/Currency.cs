using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Currency
    {
        public int id { get; set; }
        public string moneda { get; set; }
        public string casa { get; set; }
        public string nombre { get; set; }
        public decimal compra { get; set; }
        public decimal venta { get; set; }
        public DateTime fechaActualizacion { get; set; }
        public string bandera { get; set; }
    }
}
