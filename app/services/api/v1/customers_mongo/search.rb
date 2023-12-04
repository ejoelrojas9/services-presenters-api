class Api::V1::CustomersMongo::Search

  def self.call(params ={})
    mongo_client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'services_presenters_api_development')
    db = mongo_client.database
    customer_collection = mongo_client[:customers]
    object = Api::V1::CustomersMongo::List.new(customer_collection)
    data = object.customers.find.each do |c| 
      puts c 
    end
      
    return Api::V1::BaseService.success_response(Api::V1::CustomersMongo::List.new(customer_collection).customers.each do |customer| puts customer[:first_name] end)
  end
  
end


