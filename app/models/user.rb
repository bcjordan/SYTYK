require 'pp'
class User < ActiveRecord::Base
  attr_accessible :name, :uid, :pic_square_with_logo, :profile_url, :level_id

  has_many :answers
  has_many :questions, :through => :answers

  has_many :beens
  has_many :places, :through => :beens

  belongs_to :level

#  ajaxful_rater
#  has_many :rates

  # Creates a SYTYK User from a facebooker user
  def self.find_or_create_by_facebook_user(facebooker)
    @user = User.find_by_uid facebooker.uid
    begin
      if !@user
        puts "User not created!"
        @user = User.new(:name                 => facebooker.name,
                         :uid                  => facebooker.uid,
                         :pic_square_with_logo => facebooker.pic_square_with_logo,
                         :profile_url          => facebooker.profile_url,
                         :level_id             => 1,
                         :right                => [],
                         :want_to_go           => [])
      end
    rescue
      puts "ERROR: user creation failed."
    end

    if @user
      @user.save!
      @user
    end

  end

  def answer_score
    answers.count(:conditions => {:user_id => id, :correct => true})
  end

  def place_score
    beens.where(:yes => true).count
  end

  def no_tourist_message
    "Boston friends, think you know Boston? Help Brian out! Just by being friends with Brian, you're already on your way to PROVING you're no tourist."
  end

end

class String
  def escape_single_quotes
    self.gsub(/'/, "\\\\'")
  end
end