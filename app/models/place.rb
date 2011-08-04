class Place < ActiveRecord::Base
  attr_accessible :name, :location_name, :lat, :lng, :url, :image_url, :category, :location_id, :num_reviews, :ranking, :rating

  serialize :json

  validates_uniqueness_of :location_id

  # May be less strict with this when allowing for searched items
  validates_presence_of :name, :location_name, :lat, :lng, :url, :image_url, :category, :location_id, :num_reviews, :ranking, :rating
end
