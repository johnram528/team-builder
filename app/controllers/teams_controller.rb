class TeamsController < ApplicationController
    get '/teams' do 
      erb :'/teams/index'
  end
end