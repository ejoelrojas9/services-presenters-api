class Api::V1::Customers::Show

  def self.call(customer_id)
    customer = Customer.find customer_id
    return Api::V1::BaseService.success_response(Api::V1::Customers::Detail.present(customer))
  end
    
end