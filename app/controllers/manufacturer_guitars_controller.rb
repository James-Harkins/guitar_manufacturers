class ManufacturerGuitarsController < ApplicationController

  def index
    @manufacturer = Manufacturer.find(params[:id])
    if params[:alphabetical]
      @guitars = @manufacturer.alphabetical_guitars
    else
      @guitars = @manufacturer.guitars
    end
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    guitar = new.guitars.new({
      model: params[:model],
      num_of_frets: params[:num_of_frets],
      six_string: params[:six_string],
      })
    guitar.save
    redirect_to "/manufacturers/#{@manufacturer.id}/guitars"
  end

end
