class CoachesController < ApplicationController
  get '/login' do 
    if !logged_in?
      erb :'/coaches/login'
    else
      redirect '/'
    end
  end

  post '/login' do
    coach = Coach.find_by(user_name: params[:user_name])
    if coach && coach.authenticate(params[:password])
      session[:user_id] = coach.id
      redirect "/teams/#{coach.team_id}"
    else
      redirect '/login'
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
      @coach = Coach.new(params[:coach])
      @team = Team.new(params[:team])
      if !@coach.save || !@team.save
        redirect '/signup'
      else
        session[:user_id] = @coach.id
        redirect "/teams/#{@team.id}/build"
    end
  end

  get'/logout' do 
    session.clear
    redirect '/login'
  end

end