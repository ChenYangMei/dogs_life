class Image < ActiveRecord::Base
  belongs_to :area
  belongs_to :user
end
