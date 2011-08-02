require 'pp'

class FacebookController < ApplicationController
  ensure_authenticated_to_facebook
  
  def canvas
    fbsession = session[:facebook_session]
    
    @count = 0
    #this session variable is set automatically by the facebooker plugin
    fbsession = session[:facebook_session]
    #iterate thru your friends.  fbsession.user grabs your user account and then .friends pulls in all your friends
    fbsession.user.friends.each do |user|
      #pp user.name
#      pp user.name
#      pp user.pic_square_with_logo
#      pp user.uid
#      pp user.profile_url
      @count += 1
    end

    @name = fbsession.user.name

    #pp fbsession.user

    #pp fbsession
  end
end
