class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/recommendations'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    #clean this up with (params[:user])
    user = User.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if user.save
      #log user in
      session[:user_id] = user.id
      redirect '/recommendations'
    else
      redirect '/signup'
      #add flash message saying signup failed, please try again
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
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/recommendations'
    else
      redirect '/'
      #add flash message saying signup failed, please try again
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
