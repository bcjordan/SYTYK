module Facebooker
  
   
  class FacebookAdapter < AdapterBase
      
    def canvas_server_base
      "apps.facebook.com"
    end
      
    def api_server_base
       "api.facebook.com"
    end
    
    def video_server_base
      "api-video.facebook.com"
    end
    
    def www_server_base_url
      "www.facebook.com"
    end
    
    def api_rest_path
      "/restserver.php"
    end
    
    def api_key
      ENV['FACEBOOK_API_KEY'] || super      
    end
    
    def secret_key
      ENV['FACEBOOK_SECRET_KEY'] || super
    end
      
    def is_for?(application_context)
      application_context == :facebook
    end
       
  
       
    def login_url_base
#     # top.location.href="
      "http://#{www_server_base_url}/login.php?api_key=#{api_key}&v=1.0"
      # puts "Getting login_url_base"
#      "https://graph.facebook.com/oauth/authorize?#{api_key}&v=1.0&appId=257381854273911&redirect_uri=http%3A%2F%2Fsoyouthinkyouknow.heroku.com"
##      "http://www.facebook.com/connect/uiserver.php?app_id=257381854273911&next=http%3A%2F%2F0.0.0.0%3A3000%2F&display=page&locale=en_US&return_session=0&fbconnect=0&canvas=1&legacy_return=1&method=permissions.request"
#      "http://www.facebook.com/connect/uiserver.php?app_id=257381854273911&next=http%3A%2F%2F0.0.0.0%3A3000%2F&display=page&locale=en_US&return_session=0&fbconnect=0&canvas=1&legacy_return=1&method=permissions.request&next=http%3A%2F%2F0.0.0.0%3A3000%2F%3F&canvas=true#"
    end
       
    def install_url_base
      "http://#{www_server_base_url}/install.php?api_key=#{api_key}&v=1.0"
    end

    def connect_permission_url_base
      "http://#{www_server_base_url}/connect/prompt_permissions.php?api_key=#{api_key}&v=1.0"      
    end

    def permission_url_base
      "http://#{www_server_base_url}/authorize.php?api_key=#{api_key}&v=1.0"
    end
    
  end
  
end


