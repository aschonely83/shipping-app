class RetailersController < ApplicationController
 
  #Read
  #index
  get '/retailers' do
    @retailers = Retailer.all 
    erb :'/retailers/index'
  end
  
  #Create
  #New
  get '/retailers/new' do
    erb :'/retailers/new'
  end

  post '/retailers/new' do
    @retailers = Retailer.new(params)
    if @retailers.save 
      redirect '/retailers' 
    else 
      erb :'/retailers/new'    
    end
  end

  #show
  get '/retailers/:id' do
    @retailers = Retailer.find(params[:id])
    erb :'/retailers/show'
  end

  #Edit
  get '/retailers/:id/edit' do
    @retailers = Retailer.find(params[:id])
    erb :'/retailers/edit'
  end

  patch '/retailers/:id' do
    @retailers = Retailer.find(params[:id])
    @retailers.name = params[:name]
    @retailers.boxes = params[:boxes]
    @retailers/user_id = params[:user_id]
    @retailers.save
    redirect to '/retailers/#{@retailer.id}'
  end

  #delete
  delete '/retailers/:id' do
    @retailers = Retailer.find(params[:id])
    @retailers.delete
    redirect to '/retailers'
  end

end