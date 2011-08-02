class User < ActiveRecord::Base
  attr_accessible :name, :uid, :pic_square_with_logo, :profile_url, :level_id

  has_one :level

  # Creates a SYTYK User from a facebooker user
  def self.find_or_create_by_facebook_user(facebooker)
    @user = User.find_by_uid facebooker.uid
    begin
      if !@user
        @user = User.new(:name                 => facebooker.name,
                         :uid                  => facebooker.uid,
                         :pic_square_with_logo => facebooker.pic_square_with_logo,
                         :profile_url          => facebooker.profile_url,
                         :level_id             => 0)
      end

      @user
    rescue
      puts "ERROR: user creation failed."
      nil
    end
  end
end
