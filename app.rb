require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
end 

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2 

  erb(:square_results)
end 

get("/square_root/new") do
  erb(:new_square_root)
end 

get("/square_root/results") do

  @the_num = params.fetch("users_number").to_f 

  @the_result = @the_num ** 0.5 

  erb(:square_root_results)
end 

get("/payment/new") do
  erb(:new_payment)
end 

get("/payment/results") do

  apr = params.fetch("apr").to_f / 100
  years = params.fetch("years").to_f
  principal = params.fetch("prinicpal").to_f

  monthly_rate = apr / 12 
  number_of_payments = years * 12
  payment_result = (monthly_rate * principal) / (1 - (1 + monthly_rate) ** -number_of_payments)

  rounded_apr = (apr * 100).round(4)

  def format_currency(amount)
    "$%.2f" % amount
  end

  @the_apr = "#{rounded_apr}%"
  @years = years
  @principal = format_currency(principal)
  @paymentresult = format_currency(payment_result)

  erb(:payment_results)
end

get("/random/new") do 
  erb(:new_random_num)
end 

get("/random/results") do

  @minimum = params.fetch("number_one").to_f 

  @maximum = params.fetch("number_two").to_f 

  @random_number = rand(@minimum..@maximum).to_f

  erb(:random_number_result)
end 
