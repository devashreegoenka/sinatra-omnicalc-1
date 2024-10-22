require "sinatra"
require "sinatra/reloader"

get("/howdy") do 
  erb(:hello)
end

get("/goodbye") do 
  erb(:bye)
end

#square 

get("/square/new") do 
  erb(:new_square_calc)
end

get("/square/results") do 
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

#square root 

get("/square_root/new") do 
  erb(:square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:square_root_results)
end 

#payment 

get("/payment/new") do 
  erb(:payment)
end

get("/payment/results") do
  @the_APR= params.fetch("users_APR").to_f
  r = @the_APR/1200
  @the_year= params.fetch("users_year").to_i 
  n = @the_year * 12
  @the_principal= params.fetch("users_principal").to_f
  @the_payment = (r * @the_principal)/(1-(1+r)**(-n))
  erb(:payment_results)
end 


#random new

get("/random/new") do 
  erb(:random)
end

get("/random/results") do 
  @the_min = params.fetch("users_min").to_f
  @the_max = params.fetch("users_max").to_f
  @the_result = random(@the_min..@the_max)
  erb(:random_results)
end



get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
