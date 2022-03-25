class ManufacturerGuitarsController < ApplicationController

  def index
    @manufacturer = Manufacturer.find(params[:id])
    if params[:alphabetical]
      @guitars = @manufacturer.alphabetical_guitars
    else
      @guitars = @manufacturer.guitars
    end
  end

end
