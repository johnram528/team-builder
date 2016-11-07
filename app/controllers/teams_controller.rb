class TeamsController < ApplicationController
  get '/teams' do 
      @teams = Team.all
      erb :'/teams/index'
  end

  get '/teams/:id/build' do   
    if !logged_in?
      redirect '/login'
    elsif params[:id] != current_user.team_id || !current_user.players.empty?
      redirect '/teams'
    else
      erb :'/teams/build_roster'
    end
  end

  post '/teams/:id/build' do  
    if params["player"].detect {|player| player.values.include?("")}
      redirect "/teams/#{current_user.team_id}/build"
    else
      params[:player].each do |player| 
         new_player = Player.create(player)
         new_player.team_id = current_user.team_id
         new_player.save
      end
    end
    
    redirect "/teams/#{current_user.team_id}"
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
    if params["player"].detect {|player| player.values.include?("")}
      redirect "/teams/#{current_user.team_id}/edit"
    else
      params[:player].each do |player| 
         edited = Player.find(player[:id])
         edited.update(player)
      end
    end
    redirect "/teams/#{current_user.team_id}"
  end

end