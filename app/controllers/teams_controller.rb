class TeamsController < ApplicationController
    get '/teams' do 
      @teams = Team.all
      erb :'/teams/index'
  end

  get '/teams/:id/build' do
    @team = Team.find(params[:id])
    if !logged_in?
      redirect '/login'
    else
      erb :'/teams/build_roster'
    end
  end

  post '/teams/:id/build' do
    @team = Team.find(params[:id])
    params[:player].each do |player|
     new_player = Player.create(player)
     new_player.team_id = @team.id
    end
    
    redirect "/teams/#{@team.id}"
  end

  get '/teams/:id' do
    @team = Team.find(params[:id]) 
    erb :'/teams/team_show'
  end

  get '/teams/:id/edit' do
    if !logged_in?
      redirect'/login'
    elsif current_user.id != params[:id]
      redirect '/teams'
    else
      @team = Team.find(params[:id]) 
      erb :'/teams/team_edit'
    end
  end



end