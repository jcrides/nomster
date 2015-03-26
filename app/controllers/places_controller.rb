class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.paginate(:page => params[:page]).order('created_at DESC')
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @place = Place.where(:id => params[:id]).first
    if @place.blank?
      render :text => 'No such place found', :status => :not_found
    else
      @comment = Comment.new
      @photo = Photo.new
    end
  end

  def edit
    @place = Place.where(:id => params[:id]).first
    if @place.blank?
      render :text => 'No such place found', :status => :not_found
    else
      if @place.user != current_user
        return render :text => 'This is not your place', :status => :unauthorized
      end
    end
  end

  def update
    @place = Place.where(:id => params[:id]).first

    if @place.blank?
      render :text => 'No such place found', :status => :not_found
    else
      if @place.user != current_user
        return render :text => 'This is not your place', :status => :unauthorized
      end

      @place.update_attributes(place_params)
      if @place.valid?
        redirect_to root_path
      else
        render :edit, :status => :unprocessable_entity
      end
    end

  end

  def destroy
    @place = Place.where(:id => params[:id]).first

    if @place.blank?
      render :text => 'No such place found', :status => :not_found
    else
      if @place.user != current_user
        return render :text => 'This is not your place', :status => :unauthorized
      end

      @place.destroy
      redirect_to root_path
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end

end
