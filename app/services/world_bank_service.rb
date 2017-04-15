class WorldBankService


  def initialize
    @connection = Faraday.new("http://api.worldbank.org/")
  end

  def country_code(code)
    response = @connection.get("/countries/#{code}?format=json")
    country = JSON.parse(response.body)
  end

end