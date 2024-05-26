namespace ManagedIdentityDemo.API.Data;

public sealed class Customer
{
    public Guid Id { get; set; }
    public required string FirstName { get; set; }
    public required string LastName { get; set; }
}
