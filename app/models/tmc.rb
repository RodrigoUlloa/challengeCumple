from(*date_array)
require "uri"
require "net/http"
require "byebug"
require "json"

class TMC
  API_KEY ='apikey=9c84db4d447c80c74961a72245371245cb7ac15f'
  FORMAT = 'formato=json'

  def from(year, month, year1, month1)
    url = URI("https://api.sbif.cl/api-sbifv3/recursos_api/tmc/periodo/#{year}/#{month}/#{year1}/#{month1}?=&#{API_KEY}&#{FORMAT}")
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    JSON.parse(response.read_body)
  end
end
