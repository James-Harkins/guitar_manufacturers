class ManufacturerGuitarsController < ApplicationController

  def index
    @manufacturer = Manufacturer.find(params[:id])
    if params[:alphabetical]
      @guitars = @manufacturer.guitars.order(:model)
    else
      @guitars = @manufacturer.guitars
    end
  end

end
