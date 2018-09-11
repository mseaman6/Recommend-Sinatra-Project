require 'rack-flash'

class RecommendationsController < ApplicationController
  use Rack::Flash

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
    if params[:category]
      @category = Category.create(params[:category])
    end
    @recommendation = Recommendation.create(params[:recommendation])
    @recommendation.user_id = session[:user_id]
      if @category
        @recommendation.category_id = @category.id
      end
    if @recommendation.save
      redirect "/recommendations/#{@recommendation.id}"
    else
      flash[:message] = "The new recommendation failed to be created.  Please make sure that you complete all required fields and try again."
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

  get '/recommendations/:id/edit' do
    if logged_in?
      #if @recommendation = current_user.recommendations.find_by(params[:id])
      @recommendation = Recommendation.find(params[:id])
      if current_user.id == @recommendation.user_id
        erb :'recommendations/edit_recommendation'
      else
        flash[:message] = "The recommendation can only be edited by the user that created it."
        redirect "/recommendations/#{params[:id]}"
      end
    else
      redirect '/login'
    end
  end

  post '/recommendations/:id' do
    @recommendation = Recommendation.find(params[:id])
    @recommendation.update(params[:recommendation])
    if @recommendation.save
      redirect "/recommendations/#{@recommendation.id}"
    else
      redirect "/recommendations/#{@recommendation.id}/edit"
    end
  end

  delete '/recommendations/:id/delete' do
    if logged_in?
      @recommendation = Recommendation.find(params[:id])
      if current_user.id == @recommendation.user_id
        @recommendation = Recommendation.destroy(params[:id])
        flash[:message] = "The recommendation can only be deleted by the user that created it."
        redirect '/recommendations'
      else
        redirect '/recommendations'
      end
    else
      redirect '/login'
    end
  end

end
