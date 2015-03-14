class Place < ActiveRecord::Base
  belongs_to :user

  self.per_page = 6

end
