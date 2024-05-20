using ManagedIdentityDemo.API.Data;
using Microsoft.Azure.Cosmos;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddSingleton<CosmosClient>(_ =>
{
    var connectionString = builder.Configuration.GetConnectionString("CosmosDB");

    var client = new CosmosClient(connectionString);

    return client;
});

builder.Services.AddSingleton<ICustomerRepository, CustomerRepository>(sp =>
{
    var client = sp.GetRequiredService<CosmosClient>();
    var container = client.GetContainer("demo", "customers");

    return new CustomerRepository(container);
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapGet("/customers", async (ICustomerRepository repository, CancellationToken cancellationToken) =>
    {
        var customers = await repository.GetCustomersAsync(cancellationToken);

        return customers;
    })
    .WithName("GetCustomers")
    .WithOpenApi();

app.Run();
