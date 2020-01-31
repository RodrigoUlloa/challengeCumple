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

  def from_to(from, to)
    data = {}
    year = from.year
    month = from.month
    year1 = to.year
    month1 = to.month
    info = from(year, month, year1, month1)
    begin
      data[info['TMCs'][0]['Fecha']] = info['TMCs'][0]['Valor'][0]['Tipo']
    end

  end

end
