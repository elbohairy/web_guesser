require 'sinatra'
require 'sinatra/reloader'

number ||= rand 101

def message num, guess
  if guess > (num + 5)
    "Way too high!"
  elsif guess > num
    "Too high!"
  elsif guess == num
    "You got it right!<br />The SECRET NUMBER is #{num}"
  elsif guess < (num - 5)
    "Way too low!"
  elsif guess < num
    "Too low!"
  end
end


get '/' do
  user_guess = params['guess'].to_i
  response = message number, user_guess
  erb :index, :locals => {:number => number, :user_guess => user_guess, :message => response}
end
