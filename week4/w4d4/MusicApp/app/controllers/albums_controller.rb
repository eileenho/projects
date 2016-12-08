class AlbumsController < ApplicationController

  def new
    @album = Album.new
    render 'new'
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to bands_url
    else
      render 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
    render 'edit'
  end

  def updated
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.new[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :album_name, :studio_or_live)
  end
end
