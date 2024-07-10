using HitssIngresoBusinessLogic.Data;
using HitssIngresoBusinessLogic.Models;

namespace HitssIngresoBusinessLogic.Repositories.Implements
{
    public class ProductoRepository : GenericRepository<Producto>, IProductoRepository
    {
        public ProductoRepository(IngresoHitssContext ingresoHitssContext) : base(ingresoHitssContext)
        {

        }
    }
}