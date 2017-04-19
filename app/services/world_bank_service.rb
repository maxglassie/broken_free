class WorldBankService


  def initialize
    @connection = Faraday.new("http://api.worldbank.org/")
  end

  def country_code(code)
    response = @connection.get("/countries/#{code}?format=json")
    country = JSON.parse(response.body)
  end

  def highest_income_share(code)
    response = @connection.get("/countries/#{code}/indicators/SI.DST.10TH.10?date=2013:2016&format=json")
    income_share = JSON.parse(response.body)
  end

  def lowest_income_share(code)
    response = @connection.get("/countries/#{code}/indicators/SI.DST.FRST.10?date=2013:2016&format=json")
    income_share = JSON.parse(response.body)
  end

  def fuel_exports(code)
    response = @connection.get("/countries/#{code}/indicators/TX.VAL.FUEL.ZS.UN?date=2013:2016&format=json")
    fuel_exports = JSON.parse(response.body)
  end

  def central_government_debt(code)
    response = @connection.get("/countries/#{code}/indicators/GC.DOD.TOTL.GD.ZS?date=2013:2016&format=json")
    central_government_debt = JSON.parse(response.body)
  end

end