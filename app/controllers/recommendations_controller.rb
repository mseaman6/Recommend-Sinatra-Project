class RecommendationsController < ApplicationController

  get '/recommendations' do
    if logged_in?
      erb :'recommendations/recommendations'
    else
      redirect '/login'
    end
  end

  get '/recommendations/new' do
    if logged_in?
      erb :'recommendations/create_recommendation'
    else
      redirect '/login'
    end
  end

  post '/recommendations' do
    @recommendation = Recommendation.create(params[:recommendation])
    @recommendation.user_id = session[:user_id]
    if @recommendation.save
      redirect "/recommendations/#{@recommendation.id}"
    else
      #add flash message for the new recommendation failed to be created, please try again
      redirect "/recommendations/new"
    end
  end

  get '/recommendations/:id' do
    if logged_in?
      @recommendation = Recommendation.find(params[:id])
      erb :'recommendations/show_recommendation'
    else
      redirect '/login'
    end
  end

end
