class RetailersController < ApplicationController
 
  #index
  get "/retailers" do
    redirect_if_not_logged_in
    @retailers = current_user.retailers
    erb :"/retailers/index"
  end

  #create 
  post "/retailers" do
    redirect_if_not_logged_in
    @retailers = current_user.retailers.create(name: params[:name], boxes: params[:boxes])
    redirect "/retailers/#{@retailers[:id]}"
  end

  #new
  get "/retailers/new" do
    redirect_if_not_logged_in
    erb :"/retailers/new"
  end

  #show
  get "/retailers/:id" do
    redirect_if_not_logged_in
    @retailers = Retailer.find_by_id(params[:id])
    erb :"/retailers/show"
  end

  #edit
  get "/retailers/:id/edit" do
    redirect_if_not_logged_in
    @retailers = Retailer.find_by_id(params[:id])
    erb :"/retailers/edit"
  end

  #PATCH: /retailers/5
  patch '/retailers/:id' do
    redirect_if_not_logged_in
    @retailers = Retailer.find_by_id(params[:id])
    redirect "/retailers" unless @retailers
    if @retailers.update(name: params[:name],boxes: params[:boxes])
       redirect '/retailers/#{@retailers[:id]}'
    else
      erb :'/retailers/edit'
    end
  end

  #DELETE: /retailers/5
  delete "/retailers/:id/delete" do
    redirect_if_not_logged_in
    @retailers = Retailer.find_by_id(params[:id])
    redirect '/retailers' unless @retailers
    if @retailers.destroy
      redirect to "/retailers"
    end
  end  
end