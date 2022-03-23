class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all.order(:created_at)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

end
