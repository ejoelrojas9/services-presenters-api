module Admins
  class SessionsController < Devise::SessionsController
    respond_to :json

    def create
      response = Api::V1::Sessions::Login.call(email: params[:email], password: params[:password])
      if response[:response][:success] == true
        #session[:current_admin_id] = response[:response][:data][:user_id]
        user = Admin.find response[:response][:data][:user_id]
        sign_in(user)
      end
      render json: response[:response], status: response[:status]
    end

    private
    def respond_with(resource, _opts = {})
      render json: resource
    end

    def respond_to_on_destroy
      current_admin ? log_out_success : log_out_failure
    end

    def log_out_success
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    end

    def log_out_failure
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
