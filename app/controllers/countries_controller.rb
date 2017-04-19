class CountriesController < ApplicationController

  def show
    @code = Country.find(params["format"]).code
    @decorator = CountryDecorator.find_by_country_code(@code)
  end
end