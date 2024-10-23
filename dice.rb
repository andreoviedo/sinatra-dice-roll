require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
  
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
	second_die = rand(1..6)
  sum = first_die + second_die
	
	outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
	"<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
	second_die = rand(1..10)
  sum = first_die + second_die
	
	@outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
	erb(:two_six, { :layout => :wrapper })
end

get("/dice/1/20") do
  @die = rand(1..20)

  @outcome = "You rolled a #{@die}."

  erb(:one_twenty)
end

get("/dice/5/4") do
  first_die = rand(1..4)
	second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die
	
	outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, and a #{fourth_die} for a total of #{sum}."
	
	"<h1>5d4</h1>
   <p>#{outcome}</p>"
end

# /dice.rb

get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six)
end
