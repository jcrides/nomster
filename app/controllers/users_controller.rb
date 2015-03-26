class UsersController < ApplicationController

  def show
    @user =   User.where(:id => params[:id]).first
    if @user.blank?
      render :text => 'No such user found', :status => :not_found
    else
      @places = Place.where("user_id = #{params[:id]}").paginate(:page => params[:page]).order('created_at DESC')
    end
  end

end
