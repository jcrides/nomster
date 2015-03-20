class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @places = Place.where("user_id = #{params[:id]}").paginate(:page => params[:page]).order('created_at DESC')
  end

end
