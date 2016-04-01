class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :require_user!

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)

      if @album.save
        redirect_to bands_url
      else
        flash.now[:error] = @album.errors.full_messages
        render :new
      end

  end

  def update

      if @album.update(album_params)
        redirect_to bands_url
      else
        render :edit
      end

  end

  def destroy
    @album.destroy
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:band_id)
  end

end
