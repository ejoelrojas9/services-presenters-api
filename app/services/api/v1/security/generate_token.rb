class Api::V1::Security::GenerateToken

  def self.call(params)
    user = params[:user]
    payload = {
      id: user.id,
      email: user.email,
      # is_super: user.is_super,
      exp: 9999999999
    }
    Api::V1::Security::Jwt.encode(payload)
  end

end
