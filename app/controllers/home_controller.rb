class HomeController < ApplicationController

  def index
    @presenter = Presenter.new
  end

  def show
  end
end