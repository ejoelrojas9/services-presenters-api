class Api::V1::BaseService

  def self.required_fields_present?(params, required_params)
    return required_params.all?{|key| params.has_key?(key) and params[key].present?}
  end

  def self.success_response(data = nil)
    return {success: true, data: data, status: 200}
  end

  def self.fail_response(data,code = 403)
    return {success: false, status: code, data: data}
  end

  def self.build_meta(per,page,total_results)
    {
      per_page: per.to_i,
      page: page.to_i,
      total_results: total_results
    }
  end

end