class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @track = Track.new
  end

  def edit
  end


  def create
    @track = Track.new(track_params)

      if @track.save
      else
      end
    end
  end

  def update
      if @track.update(track_params)
      else
      end
    end
  end

  def destroy
    @track.destroy

  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:album_id)
    end
end
