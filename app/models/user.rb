class User < ActiveRecord::Base
  attr_accessible :name, :uid, :pic_square_with_logo, :profile_url, :level_id
end
