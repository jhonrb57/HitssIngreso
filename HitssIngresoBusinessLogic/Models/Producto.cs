using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HitssIngresoBusinessLogic.Models
{
    [Table("Producto", Schema = "dbo")]
    public class Producto
    {
        [Key]
        public string IdProducto { get; set; }
        public int CodigoProducto { get; set; }
        public string NombreProducto { get; set; }
        public byte[] Imagen { get; set; }
        public decimal Precio { get; set; }
    }
}
