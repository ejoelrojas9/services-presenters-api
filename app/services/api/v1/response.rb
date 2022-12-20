class Api::V1::Response

  def self.build_success(message,data)
    {success: true, message:message, data:data, status: 200}
  end

  def self.build_error(message,data = nil, status = 403)
    {success: false, message: message, data:data, status: status}
  end
  
end