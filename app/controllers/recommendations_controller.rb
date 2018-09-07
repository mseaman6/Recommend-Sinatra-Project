class RecommendationsController < ApplicationController

  get '/recommendations' do
    Hello World!
    #if logged_in?
    #  erb :'recommendations/recommendations'
    #else
    #  redirect '/login'
    #end
  end

end
