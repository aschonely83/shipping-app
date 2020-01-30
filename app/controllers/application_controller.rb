require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shippingapp"
    register Sinatra::Validation
  end


  get '/' do
    validates do
      params do
        required("email").filled(:str?)
        required("password").filled(:str?)
      end
    erb :welcome
  end

  helpers 
    
  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  
end

