class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, :presence => true, :length => { minimum: 3 }
  validates :address, :presence => true
  validates :description, :presence => true

  geocoded_by :address
  after_validation :geocode

  self.per_page = 6

end
