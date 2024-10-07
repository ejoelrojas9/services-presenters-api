class Customers::CustomerUpdateApikeyJob < ActiveJob::Base
  queue_as :default

  def perform(customer_id)
    customer = Customer.find customer_id
    api_key_number = Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)
    customer.update_column(:api_key, api_key_number)
  end
end