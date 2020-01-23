class UsersController < ApplicationController
 
  get '/users/:id' do
    if !logged_in?
      redirect '/retailers'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/retailers'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/retailers'
    end
  end

  post '/signup' do 
    if params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
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
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
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