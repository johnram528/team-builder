class TeamsController < ApplicationController
    get '/teams' do 
      if !logged_in?
        redirect '/login'
      else
        @team = Team.find(session[:user_id])
        erb :'/teams/index'
      end
  end
end