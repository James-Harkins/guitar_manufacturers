class ManufacturerGuitarsController < ApplicationController

  def index
    @manufacturer = Manufacturer.find(params[:id])
    if params[:alphabetical]
      @guitars = @manufacturer.alphabetical_guitars
    elsif params[:minimum_frets]
      @guitars = @manufacturer.guitars_with_frets_over(params[:minimum_frets])
    else
      @guitars = @manufacturer.guitars
    end
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    guitar = new.guitars.new(guitar_params)
    guitar.save
    redirect_to "/manufacturers/#{@manufacturer.id}/guitars"
  end

  private
  def guitar_params
    params.permit(:model, :num_of_frets, :six_string)
  end

end
