require "uri"
require "net/http"
require "json"


class Dollar

  API_KEY ='apikey=9c84db4d447c80c74961a72245371245cb7ac15f'
  FORMAT = 'formato=json'

  def from(year, month, day)
    url = URI("https://api.sbif.cl/api-sbifv3/recursos_api/dolar/#{year}/#{month}/dias/#{day}?#{API_KEY}&#{FORMAT}")
    http = Net::HTTP.new(url.host, url.port);
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    JSON.parse(response.read_body)
  end

  def from_to(from, to)
    data = {}
    (from..to).each do |date|
      date_array = date.strftime("%Y %m %d").split(' ')
      info = from(*date_array)
      begin
        data[info['Dolares'][0]['Fecha']] = info['Dolares'][0]['Valor']
      rescue
        data[date.to_s]=info['Mensaje']
      end
    end
    return data
  end
end
