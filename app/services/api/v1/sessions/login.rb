class Api::V1::Sessions::Login

	def self.call(params)
		email = params[:email].downcase rescue ""
		password = params[:password] rescue ""

		if email.blank? or password.blank?
			response = Api::V1::Response.build_error("Email and password are required")
			status = :forbidden
		else
			user = Admin.where(email: email).first
			if user.nil?
				response = Api::V1::Response.build_error("Email and password doesn't match our records")
				status = :forbidden
			else
				if user.valid_password?(password)
					response = Api::V1::Response.build_success("Login OK",{ token: Api::V1::Security::GenerateToken.call(user: user), user_id: user.id })
				else
					response = Api::V1::Response.build_error("Password doesn't match our records")
					status = :forbidden
				end
			end
		end
		{response: response, status: status}
	end

end
