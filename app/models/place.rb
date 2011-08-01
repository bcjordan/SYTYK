class Place < ActiveRecord::Base
  attr_accessible :name, :location_name, :lat, :lng, :url, :image_url, :category, :location_id, :num_reviews, :ranking

  validates_uniqueness_of :location_id

  
end
