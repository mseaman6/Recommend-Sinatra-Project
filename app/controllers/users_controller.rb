require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect '/recommendations'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save
      #log user in
      session[:user_id] = user.id
      redirect '/recommendations'
    else
      flash[:message] = "Your signup was unsuccessful.  Please make sure that you complete all required fields and try again."
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/recommendations'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/recommendations'
    else
      flash[:message] = "Your login was unsuccessful, please re-enter your information and try again."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/users/:id' do
    if logged_in?
      @user = User.find(params[:id])
      erb :'users/show'
    else
      redirect '/login'
    end
  end

end
