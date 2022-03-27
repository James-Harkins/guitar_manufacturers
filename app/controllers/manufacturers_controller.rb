class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.order_descending
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
  end

  def create
    manufacturer = Manufacturer.new({
      name: params[:name],
      headquarter_city: params[:headquarter_city],
      years_in_business: params[:years_in_business],
      custom_shop: params[:custom_shop]
      })
    manufacturer.save
    redirect_to '/manufacturers'
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.update({
      name: params[:name],
      headquarter_city: params[:headquarter_city],
      years_in_business: params[:years_in_business],
      custom_shop: params[:custom_shop]
      })
    manufacturer.save
    redirect_to "/manufacturers/#{manufacturer.id}"
  end

  def destroy
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.guitars.destroy_all
    manufacturer.destroy
    redirect_to "/manufacturers"
  end

end
