class SearchController < ApplicationController

  def new
    binding.pry
  end

  def show
    binding.pry
    @country = CountryObject.find_by_country_code(params["Search"])
  end
end