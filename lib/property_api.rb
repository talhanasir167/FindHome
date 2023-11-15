require 'json'
require 'uri'
require 'net/http'

class PropertyAPI
  BASE_URL = 'https://exchange.staging.thirdhome.com/api/v3'

  def initialize(api_token)
    @api_token = api_token
  end

  def get_availabilities(params = {})
    response = get_http_response("/availabilities", params)
    
    JSON.parse(response.body)
  end

  def get_availability(id, params = {})
    response = get_http_response("/availabilities/#{id}", params)
    
    JSON.parse(response.body)
  end

  def get_property(id, params = {})
    response = get_http_response("/properties/#{id}", params)
    
    JSON.parse(response.body)
  end

  private
  def get_http_response(uri_str, params)
    uri = URI("#{BASE_URL}#{uri_str}?#{URI.encode_www_form(params)}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Token token=\"#{@api_token}\""

    http.request(request)
  end
end
