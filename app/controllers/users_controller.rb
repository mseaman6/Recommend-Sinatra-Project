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
    #clean this up with (params[:user]) instead of :username => params[:username], :password => params[:password], :email => params[:email]
    user = User.new(params[:user])
    if user.save
      #log user in
      session[:user_id] = user.id
      redirect '/recommendations'
    else
      #flash message saying signup failed, please try again
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
    #clean up/rework with params[:user][:username], etc.
    user = User.find_by(:username => params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/recommendations'
    else
      #add flash message saying signup failed, please try again
      flash[:message] = "Your login was unsuccessful, please re-enter your information and try again."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
