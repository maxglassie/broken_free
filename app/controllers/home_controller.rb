class HomeController < ApplicationController

  def index
    @presenter = Presenter.new
  end
end