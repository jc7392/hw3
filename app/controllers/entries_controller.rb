class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
    @place_id = params[:place_id]
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to "/places/#{@entry.place_id}", notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def entry_params
      params.require(:entry).permit(:title, :description, :posted_on, :place_id, )
    end

end
