class UsersController < ApplicationController
 
  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/retailers'
    end
  end  

  post '/signup' do
    if params.values.any? {|value| value == ""}
      erb :'/users/signup'
    else
      @user = User.new(email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/retailers'
    end 
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/retailers'     
    end
  end

  post '/login' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user_id
      redirect to '/retailers'
    else
      erb :'/users/login'    
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/'
    else
      redirect to '/retailers'
    end      
  end
end