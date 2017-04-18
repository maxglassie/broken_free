# require 'csv'
# require 'pry'

# def import_EFI_data(file, year)
#   score_argument = "score_#{year}".to_sym

#   CSV.foreach(file, encoding: 'iso-8859-1:utf-8', headers: true, header_converters: :symbol) do |row|
#     country_name = row[:country_name]
#     region = row[:region]
#     score = row[score_argument]

#     region = Region.find_or_create_by(title: region)
#     data_year = Year.find_or_create_by(year: year)
#     country = Country.find_or_create_by(name: country_name, region: region)
#     indicator = Indicator.find_or_create_by(country: country, year: data_year, economic_freedom_index: score)

#     puts "Added #{country.name} in the #{country.region.title} region EFI data"
#   end
#   puts "Imported EFI #{year} data"
# end

#   #files
#   EFI_2013 = 'db/csv/EFI_index2013_data.csv'
#   year_2013 = "2013"
#   EFI_2014 = 'db/csv/EFI_index2014_data.csv'
#   year_2014 = "2014"
#   EFI_2015 = 'db/csv/EFI_index2015_data.csv'
#   year_2015 = "2015"
#   EFI_2016 = 'db/csv/EFI_index2016_data.csv'
#   year_2016 = "2016"

#   #methods
#   import_EFI_data(EFI_2013, year_2013)
#   import_EFI_data(EFI_2014, year_2014)
#   import_EFI_data(EFI_2015, year_2015)
#   import_EFI_data(EFI_2016, year_2016)