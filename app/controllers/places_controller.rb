class PlacesController < ApplicationController

  def index
    @places = Place.paginate(:page => params[:page])
  end

end
