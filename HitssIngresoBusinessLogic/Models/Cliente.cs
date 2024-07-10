using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HitssIngresoBusinessLogic.Models
{
    [Table("Cliente", Schema = "dbo")]
    public class Cliente
    {
        [Key]
        public string IdCliente { get; set; }
        public int CodigoCliente { get; set; }
        public string NombreCliente { get; set; }
    }
}
