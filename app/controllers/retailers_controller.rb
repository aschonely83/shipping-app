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
    if logged_in?
      @retailers = current_user.retailers.create(params)
      redirect "/retailers/#{@retailers[:id]}"
    else
      redirect '/retailers/index'
    end  
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
    if @retailers = Retailer.find_by_id(params[:id])
      erb :"/retailers/show"
    else
      redirect "/retailers"
    end  
  end

  #edit
  get "/retailers/:id/edit" do
    if logged_in? 
      @retailer = Retailer.find_by_id(params[:id])
      if current_user == @retailer.user
        erb :"/retailers/edit"
      else
        redirect '/login'  
      end  
    else
      redirect '/login'
    end  
  end

  #PATCH: /retailers/5
  patch '/retailers/:id' do
    @retailers = Retailer.find_by_id(params[:id])
    redirect "/retailers" unless @retailers 
    if @retailers.update(name: params[:name],boxes: params[:boxes])
       redirect '/retailers/#{@retailers[:id]}'
    else
      erb :'/retailers/edit'
    end
  end

  #DELETE: /retailers/5
  delete "/retailers/:id" do
    if logged_in?
      @retailer = Retailer.find(params[:id])
      if current_user == @retailer.user
        @retailer.destroy
        redirect "/retailers"
      else
        redirect '/login'
      end    
    else
      redirect '/login'
    end
  end
end

