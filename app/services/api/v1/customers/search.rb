class Api::V1::Customers::Search

  def self.call(params ={})
    customers = Customer.all
    customers = customers.order('ID asc')
    return Api::V1::BaseService.success_response(customers.map{|customer| Api::V1::Customers::List.present(customer)})
  end
  
end