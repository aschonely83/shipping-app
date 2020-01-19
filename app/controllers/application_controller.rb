require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shipping_security"
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end
  
  helpers do
    def current_user
      User.find_by(session[:user_id])
    end
    
    def logged_in?
      !!current_user
    end

    def error_message
      unless logged_in?
        flash[:notice] = "You are not logged in, Please log in."
        redirect "/login"
     end
    end
  end
end
