class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.order_descending
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
  end

end
