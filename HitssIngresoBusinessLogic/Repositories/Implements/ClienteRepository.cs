using HitssIngresoBusinessLogic.Data;
using HitssIngresoBusinessLogic.Models;

namespace HitssIngresoBusinessLogic.Repositories.Implements
{
    public class ClienteRepository : GenericRepository<Cliente>, IClienteRepository
    {
        public ClienteRepository(IngresoHitssContext ingresoHitssContext) : base(ingresoHitssContext)
        {

        }
    }
}