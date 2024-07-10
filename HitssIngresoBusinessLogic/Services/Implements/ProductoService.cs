using HitssIngresoBusinessLogic.Models;
using HitssIngresoBusinessLogic.Repositories;

namespace HitssIngresoBusinessLogic.Services.Implements
{
    public class ProductoService : GenericService<Producto>, IProductoService
    {
        public ProductoService(IProductoRepository productoRepository) : base(productoRepository)
        {

        }
    }
}