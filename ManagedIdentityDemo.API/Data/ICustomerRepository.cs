namespace ManagedIdentityDemo.API.Data;

public interface ICustomerRepository
{
    Task<IEnumerable<Customer>> GetCustomersAsync(CancellationToken cancellationToken);
}
