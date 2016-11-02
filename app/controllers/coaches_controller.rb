class CoachesController < ApplicationController
  get '/login' do 
    if !logged_in?
      erb :'/coaches/login'
    else
      redirect '/'
    end
  end

  get '/signup' do 
    if !logged_in?
      erb :'/coaches/new'
    else
      redirect '/'
    end
  end

end