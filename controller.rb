require('sinatra')
require('sinatra/reloader') if development?

require_relative('./models/rps.rb')
also_reload('./models/*')

get '/:hand1/:hand2' do
  hand1 = params[:hand1]
  hand2 = params[:hand2]
  @winner =  RPSGame.check_win(hand1, hand2)
  erb(:result)
end

get '/' do
  erb(:home)
end

get '/rules' do
  erb(:rules)
end 
