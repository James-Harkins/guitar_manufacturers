class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def show_guitars
    @manufacturer = Manufacturer.find(params[:id])
    @guitars = @manufacturer.guitars
  end

end
