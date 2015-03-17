class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  RATINGS = {
      'one star'    =>  '1',
      'two stars'   =>  '2',
      'three stars' =>  '3',
      'four stars'  =>  '4',
      'five stars'  =>  '5'
  }

end
