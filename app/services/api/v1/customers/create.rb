class Api::V1::Customers::Create

	def self.call(customer_params)
		customer = Customer.new
		customer = Customer.new customer_params
		if customer.save
			return Api::V1::BaseService.success_response(Api::V1::Customers::Detail.present(customer))
		else
			return Api::V1::BaseService.fail_response(Api::V1::Customers::List.present(customer))
		end
	end
end