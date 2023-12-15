# frozen_string_literal: true

module Api::V1::Managers
  class Api::V1::BaseController < ApplicationController

    def check_session
      # token = request.headers[:token]
      token = request.authorization.gsub('Bearer ', '')
      if token.nil?
        puts "-> Token expected"
        response = Api::V1::Response.build_error("Token Expected.")
        status = :unauthorized
      else

        begin
          decoded_token = Api::V1::Security::Jwt.decode(token)
    		rescue JWT::ImmatureSignature
    			puts "-> Immature signature token detected"
          response = Api::V1::Response.build_error("Token with immature signature detected.")
    			status = :unauthorized
    		rescue JWT::ExpiredSignature
    			puts "-> Expired token detected"
          response = Api::V1::Response.build_error("Token is expired.")
    			status = :unauthorized
        rescue JWT::VerificationError
    			puts "-> Wrong signature"
          response = Api::V1::Response.build_error("Wrong signature.")
    			status = :unauthorized
    		rescue Exception => e
    			puts "-> Exception came up #{e} -> Token: #{token}"
          response = Api::V1::Response.build_error("An error has ocurred while decrypting the token.")
    			status = :unauthorized
    		end

        if decoded_token.present?
          @current_user = Admin.find_by(id: decoded_token[0]["id"])
          if @current_user.nil?
            response = Api::V1::Response.build_error("User not found.")
            status = :not_found
          else
            return true
          end
        end

      end
      render json: response, status: status
    end

  end
end
