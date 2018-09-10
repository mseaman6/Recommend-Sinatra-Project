class CategoriesController < ApplicationController

  get '/categories' do
    if logged_in?
      erb :'categories/categories'
    else
      redirect '/login'
    end
  end

  get '/categories/:id' do
    if logged_in?
      @category = Category.find(params[:id])
      erb :'categories/show'
    else
      redirect '/login'
    end
  end

end
