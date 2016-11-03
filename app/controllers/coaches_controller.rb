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
    if params.values[0].values.include?("") || params.values[1].values.include?("") 
      redirect 'signup'
    else
      @coach = Coach.create(params[:coach])
      @team = Team.create(params[:team])
      @team.coach = @coach
      session[:user_id] = @coach.id
      redirect '/players/build_roster'
    end
  end

  get'/logout' do 
    session.clear
    redirect '/login'
  end

end