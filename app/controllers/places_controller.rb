class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @entries = Entry.where(place_id: params[:id])
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place, notice: "Place was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @place = Place.new
  end

  private
    def place_params
      params.require(:place).permit(:name)
    end
end
