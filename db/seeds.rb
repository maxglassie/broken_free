# Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

require 'csv'
require 'pry'

class WorldBank
  def self.import_WB_countries_regions
    file = 'db/csv/WorldBank_Country_List.csv'
    CSV.foreach(file, encoding: 'utf-8', headers: true, header_converters: :symbol) do |row|
      code = row[:country_code]
      country_name = row[:table_name]
      region = row[:region]
      income_group = row[:income_group]
      wb_two_code = row[:wb_two_code]

      region = Region.find_or_create_by(title: region)
      country = Country.find_or_create_by(name: country_name, region: region)
      country.update(code: code, income_group: income_group, two_code: wb_two_code)

      puts "Added #{country.code} #{country.name} in the #{country.region.title} region World Bank data"
    end
      puts "Imported World Bank Country data"
  end
end

WorldBank.import_WB_countries_regions