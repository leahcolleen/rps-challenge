require 'sinatra'
require 'sinatra/reloader' if development?

class Rock_paper_scissors < Sinatra::Base    
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]    
    redirect '/play'
  end
    
  get '/play' do
    @name = session[:name] 
    @shape = session[:shape]
    @opponent_shape = session[:opponent_shape]

    erb :play
  end

  post '/play' do
    session[:shape] = params[:shape]
    session[:opponent_shape] = :rock
    redirect '/play'
  end

run! if app_file == $0
end
