class RetailersController < ApplicationController
  #Read
  #index
  get '/retailers' do
    @retailers = Retailer.all 
    erb :'retailers/index'
  end
  
  #show
  get '/retailers/:id' do
    @retailer = Retailer.find_by_id(params[:id])
    erb :'retailers/show'
  end

  #Create
  #New
  get '/retailers/new' do
    erb :'retailers/new'
  end

  post '/retailers/new' do
    retailer = Retailer.new(params)
    if retailer.save 
      redirect '/retailers' 
    else 
      erb :'/retailers/new'    
    end
  end
end