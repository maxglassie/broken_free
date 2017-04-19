class WorldBankIndicator

  def self.highest_income_share(country_code)
    service = WorldBankService.new
    highest_income_share = service.highest_income_share(country_code)
    highest_income_share[1].map do |indicator_data|
      WorldBankIndicator.new.add_highest_income(indicator_data)
    end
  end

  attr_reader :highest_income, :year, :country

  def initialize
  end

  def add_highest_income(data)
      @highest_income_id = data["indicator"]["id"]
      @highest_income_name = data["indicator"]["value"]
      @country = data["country"]["value"]
      @highest_income = data_cleaner(data)
      @year = data["date"]
      self
  end

  def data_cleaner(data)
    if data["value"].nil?
      "N/A"
    else
      data["value"]
    end
  end

end