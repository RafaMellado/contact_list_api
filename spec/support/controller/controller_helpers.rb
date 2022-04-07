module ControllerHelpers
  def json_hash
    JSON.parse(response.body, symbolize_names: true)
  end
end