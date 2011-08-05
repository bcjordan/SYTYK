class Place < ActiveRecord::Base
  attr_accessible :name, :location_name, :lat, :lng, :url, :image_url, :category, :location_id, :num_reviews, :ranking, :rating

  serialize :json

  validates_uniqueness_of :location_id

  # May be less strict with this when allowing for searched items
  validates_presence_of :name, :location_name, :lat, :lng, :url, :image_url, :category, :location_id, :num_reviews, :ranking, :rating

  def map_img
    "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{lng}&zoom=14&size=252x200&maptype=roadmap&sensor=false&markers=color:green%7Clabel:A%7C#{lat},#{lng}"
  end
end
