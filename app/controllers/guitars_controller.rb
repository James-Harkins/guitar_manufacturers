class GuitarsController < ApplicationController

  def index
    @guitars = Guitar.only_six_strings
  end

  def show
    @guitar = Guitar.find(params[:id])
  end

  def edit
    @guitar = Guitar.find(params[:id])
  end

  def update
    guitar = Guitar.find(params[:id])
    guitar.update({
      model: params[:model],
      num_of_frets: params[:num_of_frets],
      six_string: params[:six_string]
      })
    guitar.save
    redirect_to "/guitars/#{guitar.id}"
  end

  def destroy
    Guitar.destroy(params[:id])
    redirect_to "/guitars"
  end

end
