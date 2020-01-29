class UsersController < ApplicationController
 
  get '/signup' do
      erb :'users/signup'
    end

  post '/signup' do 
    @users = User.create(:email => params[:email], :password => params[:password])
    session[:user_id] = @users.id
    redirect '/retailers'
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
    if users.authenticate(params[:password])
      session[:user_id] = users.id
      redirect "/retailers"
    else
      redirect to '/'
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