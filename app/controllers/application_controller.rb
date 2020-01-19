require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "shipping_tracker_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Flash


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
