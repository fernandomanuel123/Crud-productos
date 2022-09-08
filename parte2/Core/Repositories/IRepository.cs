using System.Collections.Generic;
using System.Threading.Tasks;

namespace parte2.core.Repositories
{
    public interface IRepository<T>
    {
        Task<IEnumerable<T>> GetAll();
    }
}
