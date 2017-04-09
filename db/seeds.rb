require 'pry'
require 'csv'

def import_EFI_data
  file = 'db/csv/EPI_index2013_data.csv'

  CSV.foreach(file, encoding: 'iso-8859-1:utf-8', headers: true, header_converters: :symbol) do |row|
    country_name = row[:country_name]
    region = row[:region]
    score = row[:score_2013]

    region = Region.find_or_create_by(title: region)
    year = Year.find_or_create_by(year: "2013")
    country = Country.find_or_create_by(name: country_name, region: region)
    indicator = Indicator.find_or_create_by(country: country, year: year, EFI: score)
  end
  puts "Imported EPI 2013 data"
end

import_EFI_data