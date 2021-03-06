ENV["RACK_ENV"] ||= "development"

require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'dm-postgres-adapter'
require_relative '../db/data_mapper_setup'
require 'json'


class MakersBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index, :layout => :layout
  end

  get '/user/new' do
    erb :"/user/signup"
  end

  post '/users' do
    user = User.create(
    :name => params[:name],
    :email => params[:emailaddress],
    :password => params[:password])
    redirect '/user/login'
  end

  # redirect or show userpage 

    get '/user/login' do
      erb :"/user/login"
    end

    post '/user/login' do
      user = User.first(:email => params[:emailaddress], :password => params[:password])
      p user.id
      if user.nil?
        erb :"/user/error"
      else
        redirect "/user/#{user.id}"
      end
    end

    get '/user/:user_id' do
      @user = User.get(params[:user_id])
      erb :"/user/userpage"
    end

  get  '/user/:user_id/space/new' do
      @user = User.get(params[:user_id])
      erb :"/space/new"
    end

  post '/user/:user_id/space/new' do
    user = User.get(params[:user_id])
    user.spaces.create(name: params[:name],
                      description: params[:description],
                      price: params[:price],
                      available_from: params[:available_from],
                      available_to: params[:available_to])
    redirect "/user/#{user.id}/space"
  end


  get '/user/:user_id/space' do
    @user = User.get(params[:user_id])
    erb :"/space/user_space"
  end

  get '/space' do
    erb :"space/list"
  end

  get '/space/:space_id' do
    @space = Space.get(params[:space_id])
  
    erb :"space/space"
  end

  get '/api/space' do
    spaces = Space.all
    content_type :json
    { spaces: spaces}.to_json
  end


  run! if app_file == $0
end
