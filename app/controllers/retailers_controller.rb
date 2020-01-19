class RetailersController < ApplicationController
  
  get '/retailers' do
    if logged_in?  
      @retailers = Retailer.all 
      erb :'/retailers/index'
    else
      erb :'users/login'
    end
  end
   
  get 'retailers/new' do
    if logged_in?
      erb :'/retailers/new'
    else
      erb :'users/login'
    end
  end

  post '/retailers' do
    if params.value.any? {|value| value == ""} 
      erb :'retailers/new'
    else
      user = User.find(session[:user_id])
      @retailers = Retailer.create(name: params[:name], boxes: params[:boxes], user_id: user.id)
    redirect to "retailer/#{@retailer.user_id}"
    end
  end

  get '/retailers/:id' do
    if logged_in?
      @retailers = Retailer.find_by(params[:user_id])
      erb :'/retailers/show'
    else
      erb :'users/login'
    end
  end

  get '/retailers/:id/edit' do
    if logged_in?
      @retailers = Retailer.find(params[id])
      if @retailers.user_id == session[:user_id]
       erb :'/retailers/edit'
      else
        erb :'retailers'  
      end
    else
      erb :'users/login'
    end
  end

  patch '/retailers/:id' do
    if params.values.any? {|value| value == ""}
      @retailers = Retailer.find(params[:id])
      erb :'retailers/edit'
      redirect to "/retailers/#{params[id]/edit}"
    else
      @retailers = Retailer.find(params[:id])
      @retailers.name = params[:name]
      @retailers.boxes = params[:boxes]
      @retailers.user_id = params[:user_id]
      @retailers.save
      redirect to "/retailers/#{@retailer.id}"
    end
  end

  delete '/retailers/:id/delete' do
    @retailers = Retailer.find(params[:id])
    if session[:user_id]
      @retailers = Retailer.find(params[:id])
      if retailers.user_id == session[:user_id] 
        @retailers.delete
        redirect to '/retailers'
      else
        redirect to '/retailers'  
      end
    else
      redirect to '/login'
    end
  end
end