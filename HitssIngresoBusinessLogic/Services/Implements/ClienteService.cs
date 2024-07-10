using HitssIngresoBusinessLogic.Models;
using HitssIngresoBusinessLogic.Repositories;

namespace HitssIngresoBusinessLogic.Services.Implements
{
    public class ClienteService : GenericService<Cliente>, IClienteService
    {
        public ClienteService(IClienteRepository clienteRepository) : base(clienteRepository)
        {

        }
    }
}