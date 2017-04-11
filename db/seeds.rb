require 'pry'
require 'csv'

def import_EFI_data(file, year)
  score_argument = "score_#{year}".to_sym

  CSV.foreach(file, encoding: 'iso-8859-1:utf-8', headers: true, header_converters: :symbol) do |row|
    country_name = row[:country_name]
    region = row[:region]
    score = row[score_argument]

    region = Region.find_or_create_by(title: region)
    data_year = Year.find_or_create_by(year: year)
    country = Country.find_or_create_by(name: country_name, region: region)
    indicator = Indicator.find_or_create_by(country: country, year: data_year, economic_freedom_index: score)

    puts "Added #{country.name} in the #{country.region.title} region EFI data"
  end
  puts "Imported EFI #{year} data"
end

def import_CPI_data
  file = 'db/csv/CPI_history.csv'
  CSV.foreach(file, encoding: 'utf-8', headers: true, header_converters: :symbol) do |row|
    country_name = row[:country]
    code = row[:country_code]
    region = row[:region]

    score_2016 = row[:cpi_2016_score]
    score_2015 = row[:cpi_2015_score]
    score_2014 = row[:cpi_2014_score]
    score_2013 = row[:cpi_2013_score]

    year_2016 =  Year.find_by(year: "2016")
    year_2015 = Year.find_by(year: "2015")
    year_2014 = Year.find_by(year: "2014")
    year_2013 = Year.find_by(year: "2013")

    region = Region.find_or_create_by(title: region)
    country = Country.find_or_create_by(name: country_name, region: region)
    country.update(code: code)

    indicator_2016 = country.indicators.find_or_create_by(country: country, year: year_2016)
    indicator_2015 = country.indicators.find_or_create_by(country: country, year: year_2015)
    indicator_2014 = country.indicators.find_or_create_by(country: country, year: year_2014)
    indicator_2013 = country.indicators.find_or_create_by(country: country, year: year_2013)

    indicator_2016.update(corruption_perception_index: score_2016)
    indicator_2015.update(corruption_perception_index: score_2015)
    indicator_2014.update(corruption_perception_index: score_2014)
    indicator_2013.update(corruption_perception_index: score_2013)

    puts "Added #{country.name} in the #{country.region.title} region CPI data"
  end
    puts "Imported CPI data"
end

  #files
  EFI_2013 = 'db/csv/EFI_index2013_data.csv'
  year_2013 = "2013"
  EFI_2014 = 'db/csv/EFI_index2014_data.csv'
  year_2014 = "2014"
  EFI_2015 = 'db/csv/EFI_index2015_data.csv'
  year_2015 = "2015"
  EFI_2016 = 'db/csv/EFI_index2016_data.csv'
  year_2016 = "2016"

  #methods
  import_EFI_data(EFI_2013, year_2013)
  import_EFI_data(EFI_2014, year_2014)
  import_EFI_data(EFI_2015, year_2015)
  import_EFI_data(EFI_2016, year_2016)

  import_CPI_data