require 'pp'

class FacebookController < ApplicationController
  ensure_authenticated_to_facebook

  def canvas
    fbsession = session[:facebook_session]

    @fbuser = fbsession.user
    @user   = User.find_or_create_by_facebook_user(@fbuser)

    fbsession = session[:facebook_session]

    @count = 0
    @fbuser.friends.each do |friend|
      @count += 1
    end

    @name = @user.name
    @pic  = @user.pic_square_with_logo


    
    #pp fbsession.user

    #pp fbsession
  end

  def submit_answer_ajax
    pp params[:question_id]
    pp params[:answer_id]
    pp "Have session." if session[:facebook_session]

    # Return JS
    #   that shakes answer,
    #   calls 
  end

end
