class RetailersController < ApplicationController
 
  #index
  get "/retailers" do
    @retailers = current_user.retailers
    erb :"retailers/index"
  end

  #create 
  post "/retailers" do
   @retailers = current_user.retailers.create(params)
    redirect "/retailers/#{@retailers[:id]}"
  end

  #new
  get "/retailers/new" do
    erb :"retailers/new"
  end

  #show
  get "/retailers/:id" do
    @retailers = Retailer.find(params[:id])
    erb :"retailers/show"
  end

  #edit
  get "/retailers/:id/edit" do
    @retailers = Retailer.find(params[:id])
    erb :"retailers/edit"
  end

  #PATCH: /retailers/5
  patch '/retailers/:id' do 
    @retailers = Retailer.find(params[:id])
      if !params[:name].empty? && !params[:boxes].empty? 
        @retailers.update(name: params[:name],boxes: params[:boxes],user_id: params[:user_id])
        redirect '/retailers'
    else
      erb :'/retailers/edit'
    end
end

  #DELETE: /retailers/5
  delete "/retailers/:id" do
    @retailers = Retailer.find(params[:id])
    @retailers.delete
    redirect to "/retailers"
  end
end