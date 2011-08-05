class ApplicationController < ActionController::Base
  protect_from_forgery :except => :canvas
  before_filter :init

  rescue_from Facebooker::Session::SessionExpired, :with => :facebook_session_expired
#  rescue_from Facebooker::Session::MissingOrInvalidParameter, :with => :facebook_session_expired

  def facebook_session_expired
    clear_fb_cookies!
    clear_facebook_session_information
    reset_session
    flash[:error] = "Your facebook session has expired."
    redirect_to "https://soyouthinkyouknow.heroku.com/?reset=1"
  end

  def init
    @start_time = Time.now
  end

end
