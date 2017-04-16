class Presenter

  def all_regions
    @regions = Region.all
  end

  def all_countries
    @countries = Country.all
  end

end