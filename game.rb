require 'sinatra'

before do
  content_type :txt
  @defeat = {rock: :scissors, paper: :rock, scissors: :papers}
  @throws = @defeat.keys
end

get '/throw/:type' do
  #play here
  player_throws = params[:type].to_sym
  if !@throws.include?(player_throws)
    halt 403, "You must throw one of the folloing: #{throws}"
  end
  computer_throw = @throws.sample
  if player_throws == computer_throw
    "You tied with with the computer try again"
  elsif computer_throw == @defeat[player_throws]
    "Nicely done; #{player_throws} beats #{computer_throw}"
  else
    "Ouch; #{computer_throw} beats #{player_throws}. Better luck next time!"
  end
end
