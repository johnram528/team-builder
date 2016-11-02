class TeamsController < ApplicationController
    get '/teams' do 
      @teams = Team.all
      erb :'/teams/index'
  end

  get '/teams/:id' do
    @team = Team.find(params[:id]) 
    erb :'/teams/team_show'
  end
end