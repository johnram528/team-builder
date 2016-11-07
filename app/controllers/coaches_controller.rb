class CoachesController < ApplicationController
  get '/login' do 
    if !logged_in?
      erb :'/coaches/login'
    else
      redirect '/'
    end
  end

  post '/login' do
      if !logged_in?
        coach = Coach.find_by(user_name: params[:user_name])
        if coach && coach.authenticate(params[:password])
          session[:user_id] = coach.id
          redirect "/teams/#{coach.team_id}"
        else
          flash[:message] = "Login attempt failed. Please try again."
          redirect '/login'
        end
      else
      redirect "/teams/#{current_user.team_id}"
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
    if !logged_in?
      @coach = Coach.new(params[:coach])
      @team = Team.new(params[:team])
      if !@coach.save || !@team.save
        flash[:message] = "Please fill in all fields."
        redirect '/signup'
      else
        session[:user_id] = @coach.id
        redirect "/teams/#{@team.id}/build"
      end
    else
      redirect "/teams/#{current_user.team_id}"
    end
  end

  get'/logout' do 
    session.clear
    redirect '/login'
  end

end