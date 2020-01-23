class RetailersController < ApplicationController
 
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
  
  post '/retailers' do
    @retailers = Retailer.new(params)
    redirect '/retailers/#{@retailers[:id]}'    
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

  patch "/retailers/:id" do
    @retailers = Retailer.find_by_id(params[:id])
    redirect "/retailers" unless @retailers
    @retailers = Retailer.new(name: params[:name], boxes: params[:boxes], user_id: params[:user_id])
    if @retailers.update(name: params[:name],boxws: params[:boxes],user_id: params[:user_id])
    redirect "/retailers/#{@retailers[:id]}"
    else
      erb :'/retailers/edit'
    end  
  end

  #delete
  delete '/retailers/:id/delete' do
    @retailers = Retailer.find(params[:id])
    redirect '/retailers' unless @retailers
    if @retailers.destroy  
      redirect '/retailers'
    end
  end
end