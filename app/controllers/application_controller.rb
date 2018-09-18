require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    #set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  #could also be handled as separate handlers class (see sinatra-logging-in-and-out)
  helpers do
    def logged_in?
      !!current_user
      #!!session[:user_id]
    end

    def current_user
      #@current ||= (same as below)
      User.find_by(:id => session[:user_id])
    end
  end

end
