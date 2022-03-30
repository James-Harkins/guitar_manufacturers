 class ManufacturersController < ApplicationController

  def index
    if params[:guitar_count]
      @manufacturers = Manufacturer.sort_by_guitar_count
      @guitar_count = true
    else
      @manufacturers = Manufacturer.order_descending
      @guitar_count = false
    end
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
  end

  def create
    manufacturer = Manufacturer.new(manufacturer_params)
    manufacturer.save
    redirect_to '/manufacturers'
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.update(manufacturer_params)
    redirect_to "/manufacturers/#{manufacturer.id}"
  end

  def destroy
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.guitars.destroy_all
    manufacturer.destroy
    redirect_to "/manufacturers"
  end

  private
  def manufacturer_params
    params.permit(:name, :headquarter_city, :years_in_business, :custom_shop)
  end

end
