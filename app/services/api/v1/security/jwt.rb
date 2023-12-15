class Api::V1::Security::Jwt

  def self.encode(payload, priv_key = Rails.application.secrets.secret_key_base, alg = 'HS256')
    JWT.encode(payload,priv_key, alg)
  end

  def self.decode(token, priv_key = Rails.application.secrets.secret_key_base, alg = 'HS256')
    JWT.decode(token, priv_key, { :algorithm => alg })
  end

end
