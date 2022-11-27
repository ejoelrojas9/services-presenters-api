class Api::V1::Customers::Update

	def self.call(customer_id,customer_params)
		customer = Customer.find customer_id
    if customer.update(customer_params)
      return Api::V1::BaseService.success_response(Api::V1::Customers::Detail.present(customer))
    else
      return Api::V1::BaseService.fail_response(Api::V1::Customers::List.present(customer))
    end
	end
	
end