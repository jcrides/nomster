class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

  RATINGS = {
      'one star'    =>  '1',
      'two stars'   =>  '2',
      'three stars' =>  '3',
      'four stars'  =>  '4',
      'five stars'  =>  '5'
  }

  def send_comment_email
    NotificationMailer.comment_added(self).deliver_now
  end

end
