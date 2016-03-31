class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def show
  end


  def new
    @band = Band.new
  end

  def edit
    @band
  end

  def create
    @band = Band.new(band_params)
      if @band.save
        redirect_to bands_url(@band)
      else
        flash.now[:errors] = 'You are not unique, someone already thought of that name'
        render :new
      end
  end

  def update
      if @band.update(band_params)
        redirect_to bands_url
      else
        flash.now[:errors] = "Something broke, updated failed"
        render :edit
      end
  end

  def destroy
    @band.destroy
  end

  private

    def set_band
      @band = Band.find(params[:id])
    end

    def band_params
      params.require(:band).permit(:name)
    end
end
