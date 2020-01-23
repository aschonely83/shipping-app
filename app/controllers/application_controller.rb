require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "shipping_tracker_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  


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
  end
end
