class ManufacturerGuitarsController < ApplicationController

  def index
    @manufacturer = Manufacturer.find(params[:id])
    @guitars = @manufacturer.guitars
  end

end
