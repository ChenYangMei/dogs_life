class Area < ActiveRecord::Base
  has_and_belongs_to_many :facilities
  has_and_belongs_to_many :terrains
  belongs_to :user
  has_many :reviews

  geocoded_by :address
  after_validation :geocode

  ratyrate_rateable 'over_all', 'facility', 'safety'

end
