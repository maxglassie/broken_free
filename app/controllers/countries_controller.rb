class CountriesController < ApplicationController

  def show
    @country = Country.find(params["format"])
  end
end