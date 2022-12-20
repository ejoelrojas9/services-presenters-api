class Api::V1::Customers::List

  def self.present(customer)
    {
      customer_id: customer.id,
      company_name: customer.company_name,
      # first_name: customer.first_name,
      name: customer.name,
      # last_name: customer.last_name,
      # active: customer.active,
      # address: customer.address   
    }
    
  end
  
end