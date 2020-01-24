class RetailersController < ApplicationController
 
  
  get "/retailers" do
    @retailers = Retailer.all
    erb :'retailers/index'
  end

  get "/retailers/new" do
    erb :'retailers/new'
  end

  get "/retailers/:id/edit" do
    @retailers = Retailer.find(params[:id])
    erb :'retailers/edit'
  end

  patch '/retailers/:id' do
    @retailers = Retailer.find(params[:id])
    @retailers.name = params[:name]
    @retailers.boxes = params[:boxes]
    @retailers.user_id = params[:user_id]
    @retailers.save
    redirect to '/retailers/retailer.id}'
  end

  get "/retailers/:id" do
    @retailers = Retailer.find(params[:id])
    erb :'retailers/show'
  end

  delete '/retailers/:id' do
    @retailers = Retailer.find(params[:id])
    @retailers.delete
    redirect to '/retailers'
  end

  post "/retailers" do
    Retailer.create(params)
    redirect "/retailers"
  end
end