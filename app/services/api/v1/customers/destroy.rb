class Api::V1::Customers::Destroy

  def self.call(customer_id)
    customer = Customer.find customer_id
    if customer.destroy
      return Api::V1::BaseService.success_response(Api::V1::Customers::Message.present)
    else
      return Api::V1::BaseService.fail_response(Api::V1::Customers::List.present(customer))
    end
  end
  
end