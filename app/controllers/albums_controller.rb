class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = bands.albums.new(album_params)

      if @album.save
      else
      end

  end

  def update

      if @album.update(album_params)

      else

      end

  end

  def destroy
    @album.destroy
  end

  private

    def set_album
      @album = Album.find(params[:id])
    end
.
    def album_params
      params.require(:album).permit(:band_id)
    end
end
