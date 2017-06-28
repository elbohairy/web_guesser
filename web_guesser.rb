require 'sinatra'
require 'sinatra/reloader'

number ||= rand 101

def message num, guess
  guess = guess.to_i
  if guess > (num + 5)
    ["Way too high!", "body { background: #f00; }"]
  elsif guess > num
    ["Too high!", "body { background: #fcc; }"]
  elsif guess == num
    ["You got it right!<br />The SECRET NUMBER is #{num}",
      "body { background: #0c0; }"]
  elsif guess < (num - 5)
    ["Way too low!", "body { background: #f00; }"]
  elsif guess < num
    ["Too low!", "body { background: #fcc; }"]
  end
end


get '/' do
  user_guess = params['guess']
  response = message number, user_guess
  erb :index, :locals => {:number => number, :user_guess => user_guess, :message => response}
end
