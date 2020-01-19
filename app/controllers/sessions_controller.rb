class SessionsController < ApplicationController
    
  get '/login' do
    erb :'/users/login'
  end
    
  post '/login do'
    users = User.find_by(email: params[:email])
    if users.authenticate(params[:password]) 
      session[:user_id] = users.id
      redirect '/retailers'
    else
      flash[:error] = 'Incorrect email or password.  Please sign up or login'
        redirect '/login'
    end
  end

  delete '/logout' do
    session.clear
    redirect '/'
  end
end
