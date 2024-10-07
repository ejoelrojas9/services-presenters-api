class ApplicationController < ActionController::API

  def validate_api_key
    id = request.params[:id]
    api_key = if request.headers['apikey'].present?
                request.headers['apikey']
              elsif request.cookies['api_key']
                request.cookies['api_key']
              elsif request.params['api_key']
                request.params['api_key']
              elsif request.headers['api-key']
                request.headers['api-key']
              else
                request.headers['api-key']
              end
    valid_key(api_key, id)
  end

  def valid_key(api_key, customer_id)
    user = Admin.new
    # user.errors = []
    if api_key.blank?
      user.errors.add('api', 'key was not sent')
      render json: {success: false, desc: 'key was not sent'}, status: 400
    else
      puts "-> Used api key: #{api_key}"
      customer = Customer.find_by(api_key: api_key)
      if customer.present?
        if !(customer.id == customer_id.to_i)
          user.errors.add('api', 'key is invalid')
          render json: {success: false, desc: 'customer not found'}, status: 404
        end
      else
        user.errors.add('api', 'key is invalid')
        render json: {success: false, desc: 'key is invalid'}, status: 404
      end
    end
  end

end
