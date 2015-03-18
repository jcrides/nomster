class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  mount_uploader :placephoto, PlacephotoUploader

end
