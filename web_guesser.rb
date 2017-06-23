require 'sinatra'
require 'sinatra/reloader'

num ||= rand 101

get '/' do
  "The sEcRET NUMBAH is #{num}"
end