class TeamsController < ApplicationController
    get '/team' do 
      if !logged_in?
        redirect '/login'
      else
        @team = Team.find(session[:user_id])
        erb :'/teams/index'
      end
  end
end