class Api::V1::CustomersMongo::List

  def initialize(customer_collection)
    @customer_collection = customer_collection
  end

  def customers
    handle_customers = []

    @customer_collection.find.each do |customer|
      handle_customers << OpenStruct.new({
      company_name: customer[:company_name],
      first_name: customer[:first_name],
      last_name: customer[:last_name],
      active: customer[:active],
      address: customer[:address]  
    })
    end
    handle_customers    
  end
  
end