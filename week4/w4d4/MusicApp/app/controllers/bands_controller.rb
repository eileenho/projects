class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
    render 'new'
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      render 'new'
    end
  end

  private
  def band_params
    params.require(:band).permit(:band_name)
  end
end
