class UsersController < ApplicationController
 
  get '/users/:id' do
    if !logged_in?
      redirect '/retailers'
    end

    @users = User.find(params[:id])
    if !@users.nil? && @users == current_user
      erb :'users/show'
    else
      redirect '/retailers'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/signup'
    else
      redirect to '/retailers'
    end
  end

  post '/signup' do 
    if params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @users = User.create(:email => params[:email], :password => params[:password])
      session[:user_id] = @users.id
      redirect '/retailers'
    end
  end

  get '/login' do 
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/retailers'
    end
  end

  post '/login' do
    users = User.find_by(:email => params[:email])
    if users && users.authenticate(params[:password])
      session[:user_id] = users.id
      redirect "/retailers"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end  