class TeamsController < ApplicationController
    get '/teams' do 
      @teams = Team.all
      erb :'/teams/index'
  end
end