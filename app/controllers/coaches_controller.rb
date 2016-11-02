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

  post '/signup' do 
    if params.values[0].values.include?("") || params.values[1].values.include?("") 
      redirect 'signup'
    else
      @coach = Coach.create(params[:coach])
      @team = Team.create(params[:team])
      @team.coach = @coach
      redirect '/team'
    end
  end

end