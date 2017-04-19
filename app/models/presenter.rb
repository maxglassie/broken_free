class Presenter

  def all_regions
    @regions = Region.all
  end

  def show_countries(region)
    if region
      Country.where(region: Region.find(region))
    else
      Country.all
    end
  end

  def region_title(id)
    Region.find(id).title
  end

end