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
     new_player.save
    end
    
    redirect "/teams/#{@team.id}"
  end

  get '/teams/:id' do
    @team = Team.find(params[:id]) 
    erb :'/teams/team_show'
  end

  get '/teams/:id/edit' do
    @team = Team.find(params[:id]) 
    if !logged_in?
      redirect'/login'
    elsif @team.id != current_user.team_id
      redirect '/teams'
    else
      erb :'/teams/team_edit'
    end
  end

  patch '/teams/:id' do
    @team = Team.find(params[:id])
    @team.update(params[:team])
    params[:player].each do |player|
     edited = Player.find(player[:id])
     edited.update(player)
     edited.save
    end
    redirect "/teams/#{@team.id}"
  end




end