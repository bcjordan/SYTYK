class Level < ActiveRecord::Base
  attr_accessible :name, :description, :image_url
  
  has_many :users
end
