class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.where(:id => params[:place_id]).first
    if @place.blank?
      render :text => 'No such place found', :status => :not_found
    else
      @place.comments.create(comment_params.merge(:user => current_user))
      redirect_to place_path(@place)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
