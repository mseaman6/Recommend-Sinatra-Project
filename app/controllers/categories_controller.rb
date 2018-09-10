class CategoriesController < ApplicationController

  get '/categories' do
    if logged_in?
      erb :'categories/categories'
    else
      redirect '/login'
    end
  end



end
