class UsersController < ApplicationController
 
  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @users = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]) 
    session[:user_id] = @users.id   
    redirect to '/retailers'
  end
end