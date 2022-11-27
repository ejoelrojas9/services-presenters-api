class Api::V1::Validator
  def self.complete_params?(request_params = {}, required_params = [])
  	return false if request_params.blank?
    required_params.each do |required_param|
    	return false if !request_params.keys.map { |param| param.to_s }.include?(required_param.to_s)
    end
    return true
  end
end