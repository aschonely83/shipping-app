class RetailersController < ApplicationController
  
  #index
  get '/retailers' do
    error_message
    @retailers = Retailer.all
    erb :'/retailers/index'
  end

  #new
  get '/retailers/new' do
     error_message
    erb :'/retailers/new'
  end

  #create retailer
  post '/retailers' do
    error_message
    @retailers = current_user.retailers.create(name: params[:name], boxes: params[:boxes], user_id: params[:user_id])
    redirect to '/retailers/#{@retailers.id}'
  end

  #show
  get '/retailers/:id' do
    error_message
    @retailers = Retailer.find_by_id(params[:id])
    erb :'/retailers/show'
  end

  #load edit form
  get '/retailers/:id/edit' do
    error_message
    @retailers = Retailer.find_by_id(params[:id])
    erb :'/retailers/edit'
  end

  #edit action
  patch '/retailers/:id' do
    error_message
    @retailers = Retailer.find_by_id(params[:id])
    @retailers.name = params[:name]
    @retailers.boxes = params[:boxes]
    @retailers.user_id = params[:user_id]
    @retailers.save
    redirect to '/retailers/#{@retailers.id}'
  end

  #delete
  delete '/retailers/:id' do
    error_message
    @retailers = Retailer.find_by_id(params[:id])
    @retailers.delete
    redirect to '/retailers'
  end
end