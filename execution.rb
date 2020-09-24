class Execution
  require 'rest-client'
  require 'json'
  attr_accessor(:request_url, :response, :header, :raw_response)
  def initialize
    api_key = "2a1b7137"
    @request_url = "https://www.omdbapi.com/query_string&apikey=#{api_key}"
    @header = {"content-type" =>  "charset=utf-8"}
  end

  def find_movie(title)
    mod_request = request_url.gsub("query_string", "?t=" + title)
    @raw_response = RestClient::Request.execute(method: :get, url: mod_request,  timeout: 10, headers: header)
    @response = JSON.parse(@raw_response)
  end

end

execution = Execution.new
execution.find_movie("twister")
puts execution.response["Year"]
puts execution.raw_response.code
puts execution.raw_response.headers
puts execution.raw_response.body


