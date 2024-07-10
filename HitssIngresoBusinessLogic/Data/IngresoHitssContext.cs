using HitssIngresoBusinessLogic.Models;
using System.Data.Entity;

namespace HitssIngresoBusinessLogic.Data
{
    public class IngresoHitssContext : DbContext
    {
        private static IngresoHitssContext ingresoHitssContext = null;
        public IngresoHitssContext() : base("HitssIngresoContext")
        {
                
        }

        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Compra> Compras { get; set; }
        public DbSet<Producto> Productos { get; set; }

        public static IngresoHitssContext Create()
        {
            if (ingresoHitssContext == null)
                ingresoHitssContext = new IngresoHitssContext();

            return ingresoHitssContext;
        }
    }
}
