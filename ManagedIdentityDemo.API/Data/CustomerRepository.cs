using Microsoft.Azure.Cosmos;

namespace ManagedIdentityDemo.API.Data;

public sealed class CustomerRepository(Container container) : ICustomerRepository
{
    public async Task<IEnumerable<Customer>> GetCustomersAsync(CancellationToken cancellationToken)
    {
        var queryStreamIterator = container.GetItemQueryIterator<Customer>(new QueryDefinition("SELECT * FROM c"));

        List<Customer> customers = [];

        while (queryStreamIterator.HasMoreResults)
        {
            var records = await queryStreamIterator.ReadNextAsync(cancellationToken);
            customers.AddRange(records.Resource);
        }

        return customers;
    }
}
