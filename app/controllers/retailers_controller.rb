class RetailersController < ApplicationController
  
  #index
  get '/retailers' do
    error_message  
    @retailers = Retailer.all 
    erb :'/retailers/index'
  end
  
  #create retailer
  post '/retailers' do
    error_message
    user = User.find(session[:user_id])
     @retailers = Retailer.create(name: params[:name], boxes: params[:boxes], user_id: user.id)
    redirect to "retailer/#{@retailer.user_id}"
  end
  
  #new
  get 'retailers/new' do
    error_message
    erb :'/retailers/new'
  end

  #show
  get '/retailers/:id' do
    error_message
    @retailers = Retailer.find(params[:id])
    erb :'/retailers/show.'
  end

  #edit
  get '/retailers/:id/edit' do
    error_message
    @retailers = Retailers.find(params[:id])
    erb :'/retailers/'
  end

  #patch
  patch '/retailers/:id' do
    error_message
    @retailers = Retailer.find_by_id(params[:id])
    redirect '/retailers' unless @retailers
    if @retailers.update(name: params[:name],boxes: params[:boxes])
    redirect '/retailers/#{@retailers[:id]}'
    else
      flash[:error] = "Retailer couldn't be updated"
      erb :'/vehicles/edit'
    end
  end

  #delete
  delete '/retailers/:id/delete' do
    error_message
    @retailers = Retailer.find(params[:id])
    redirect '/retailers' unless @retailers
    if @retailers.destroy
      redirect '/retailers
    end
  end
end