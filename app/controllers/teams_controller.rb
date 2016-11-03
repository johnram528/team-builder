class TeamsController < ApplicationController
    get '/teams' do 
      @teams = Team.all
      erb :'/teams/index'
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

  get '/teams/build' do

end