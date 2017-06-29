# things I learned:
# - adding features without testing feels so bad, even in something this simple
# - TESTING IS THE GREATEST!

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
    ["You got it right!<br />The SECRET NUMBER is #{num}<br />Try guessing a new number!",
      "body { background: #0c0; }"]
  elsif guess < (num - 5)
    ["Way too low!", "body { background: #f00; }"]
  elsif guess < num
    ["Too low!", "body { background: #fcc; }"]
  end
end

@@guesses = 6

get '/' do
  user_guess = params['guess']
  cheat_mode = params['cheat']
  @@guesses -= 1
  if user_guess.to_i == number
    response = message number, user_guess
    number = rand 101
    @@guesses = 5
  elsif @@guesses == 0
    number = rand 101
    @@guesses = 5
    response = ["You lose! Trying guessing the new number"]
  else
    response = message number, user_guess
  end
  erb :index, :locals => {:number => number, :user_guess => user_guess, :message => response,
                        :cheat => cheat_mode}
end
