using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HitssIngresoBusinessLogic.Models
{
    [Table("Compra", Schema = "dbo")]
    public class Compra
    {
        [Key]
        public string IdCompra { get; set; }
        public string IdCliente { get; set; }
        public string IdProducto { get; set; }
        public DateTime FechaCompra { get; set; }
    }
}