class UsersController < ApplicationController
 
  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/new' do
    @retailers = Retailer.all
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(params[:user])
    if !params["retailer"]["name"].empty?
      @user.retailer << Retailer.create(name: params[:retailer][:name])
    end
    redirect "/users/#{@user.id}"  
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    @retailer = Retailer.all
    erb: '/users/edit'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(params[:user])

    if !params["retailer"]["name"].empty?
      @user.retailers << Retailer.create(name: params["retailer"]["name"])
    end

    redirect "/users/#{@user.id}"
  end
end