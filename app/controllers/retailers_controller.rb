class RetailersController < ApplicationController
  
  get '/retailers' do
    @retailers = Retailer.all 
    erb :'/retailers/index'
  end

  get 'retailers/new' do
      erb :'/retailers/new'
  end

  post '/retailers' do
    @retailer = Retailer.create(params[:retailer])

    if !params["user"]["name"].empty?
      @retailer.user = User.create(name: params["user"]["name"])    
    end

    retailer.save

    redirect to "retailer/#{@retailer.id}"
  end

  get '/retailers/:id' do
    @retailer = Retailer.find(params[:id])
    erb :'/retailers/show'
  end

  get '/retailers/:id/edit' do
    @retailer = Retailer.find(params[:id])
    erb :'/retailers/edit'
  end

  patch '/retailers/:id' do
    @retailer = Retailer.find(params[:id])
    @retailer.update(params[:retailer])

    if !params["user"]["name"].empty?
      @retailer.user = User.create(name: params["user"]["name"])    
    end

    retailer.save

    redirect to "retailers/#{@retailer.id}"
  end
end