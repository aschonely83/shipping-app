class RetailersController < ApplicationController
 
  #index
  get "/retailers" do
    if logged_in?
      @retailers = current_user.retailers
      erb :"/retailers/index"
    else
      redirect '/login'
    end
  end  


  #create 
  post "/retailers" do
    @retailers = current_user.retailers.create(params)
     redirect "/retailers/#{@retailers[:id]}"
   end

  #new
  get "/retailers/new" do
    if logged_in?
      erb :"/retailers/new"
    else
      redirect '/login'
    end      
  end

  #show
  get "/retailers/:id" do
    @retailers = Retailer.find_by_id(params[:id])
    erb :"retailers/show"
  end

  #edit
  get "/retailers/:id/edit" do
    if logged_in? 
      @retailers = Retailer.find_by_id(params[:id])
      erb :"/retailers/edit"
    else
      '/login'
    end  
  end

  #PATCH: /retailers/5
  patch '/retailers/:id' do
    @retailers = Retailer.find_by_id(params[:id])
    redirect "/retailers" unless @ret if @retailers.users && session[:user_id] == @retailers.users.idailers
    if @retailers.update(name: params[:name],boxes: params[:boxes])
       redirect '/retailers/#{@retailers[:id]}'
    else
      erb :'/retailers/edit'
    end
  end

  #DELETE: /retailers/5
  delete "/retailers/:id/delete" do
    if logged_in
      @retailers = Retailer.find(params[:id])
      @retailers.destroy
      redirect "/retailers"
    else
      redirect 'login'
    end
  end
end