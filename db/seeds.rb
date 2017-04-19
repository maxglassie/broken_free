require 'csv'

def import_WB_countries_regions
    file = 'db/csv/WorldBank_Country_List.csv'
    CSV.foreach(file, encoding: 'utf-8', headers: true, header_converters: :symbol) do |row|
      code = row[:country_code]
      country_name = row[:table_name]
      region_data = row[:region]
      income_group = row[:income_group]
      wb_two_code = row[:wb_two_code]

      region = Region.find_or_create_by(title: region_data)
      country = Country.find_or_create_by(region: region, code: code, name: country_name)
      country.update(income_group: income_group, two_code: wb_two_code)

      year_2016 =  Year.find_or_create_by(year: "2016")
      year_2015 = Year.find_or_create_by(year: "2015")
      year_2014 = Year.find_or_create_by(year: "2014")
      year_2013 = Year.find_or_create_by(year: "2013")

      indicator_2016 = country.indicators.create(country: country, year: year_2016)
      indicator_2015 = country.indicators.create(country: country, year: year_2015)
      indicator_2014 = country.indicators.create(country: country, year: year_2014)
      indicator_2013 = country.indicators.create(country: country, year: year_2013)

      puts "Created #{country.code} #{country.name} in the #{country.region.title} region from World Bank data"
    end
      puts "Imported World Bank Country data"
end

def import_CPI_data
    file = 'db/csv/CPI_clean_data.csv'

    CSV.foreach(file, encoding: 'utf-8', headers: true, header_converters: :symbol) do |row|
      country_name = row[:country]
      code = row[:country_code]
      region = row[:region]

      score_2016 = row[:cpi_2016_score]
      score_2015 = row[:cpi_2015_score]
      score_2014 = row[:cpi_2014_score]
      score_2013 = row[:cpi_2013_score]

      country = Country.find_by(code: code)
      year_2016 = Year.find_by(year: "2016")
      year_2015 = Year.find_by(year: "2015")
      year_2014 = Year.find_by(year: "2014")
      year_2013 = Year.find_by(year: "2013")

      indicator_2016 = Indicator.find_by(country: country, year: year_2016)
      indicator_2015 = Indicator.find_by(country: country, year: year_2015)
      indicator_2014 = Indicator.find_by(country: country, year: year_2014)
      indicator_2013 = Indicator.find_by(country: country, year: year_2013)

      indicator_2016.update(corruption_perception_index: score_2016)
      indicator_2015.update(corruption_perception_index: score_2015)
      indicator_2013.update(corruption_perception_index: score_2013)
      indicator_2014.update(corruption_perception_index: score_2014)

      puts "Added #{country.name} in the #{country.region.title} region CPI data"
    end
      puts "Imported CPI data"
end

def import_EFI_data
  file = 'db/csv/EFI_clean_data.csv'
  CSV.foreach(file, encoding: 'iso-8859-1:utf-8', headers: true, header_converters: :symbol) do |row|
    code = row[:country_code]
    region = row[:region]

    score_2016 = row[:score_efi_2016]
    score_2015 = row[:score_efi_2015]
    score_2014 = row[:score_efi_2014]
    score_2013 = row[:score_efi_2013]

    country = Country.find_by(code: code)
    year_2016 =  Year.find_by(year: "2016")
    year_2015 = Year.find_by(year: "2015")
    year_2014 = Year.find_by(year: "2014")
    year_2013 = Year.find_by(year: "2013")


    indicator_2016 = Indicator.find_by(country: country, year: year_2016)
    indicator_2015 = Indicator.find_by(country: country, year: year_2015)
    indicator_2014 = Indicator.find_by(country: country, year: year_2014)
    indicator_2013 = Indicator.find_by(country: country, year: year_2013)

    indicator_2016.update(economic_freedom_index: score_2016)
    indicator_2015.update(economic_freedom_index: score_2015)
    indicator_2014.update(economic_freedom_index: score_2014)
    indicator_2013.update(economic_freedom_index: score_2013)

    puts "Added #{country.name} in the #{country.region.title} region EFI data"
  end
  puts "Imported EFI data"
end


import_WB_countries_regions
import_CPI_data
import_EFI_data