require 'bundler'
Bundler.require()


require './models/food.rb'
require './models/order.rb'
require './models/party.rb'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant_db'
)

#-----Helpers-----------------------------------------

get '/' do
  erb :index
end
#-----Party-------------------------------------------
get '/api/parties' do
  parties = Party.all
  content_type :json
  parties.to_json
end

get '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  content_type :json
  party.to_json
end

post '/api/parties' do
  party = Party.create(params[:party])
  content_type :json
  party.to_json
end

put '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  party.update(params[:party])
  content_type :json
  party.to_json
end

patch '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  party.update(params[:party])
  content_type :json
  party.to_json
end

delete '/api/parties/:id' do
  party = Party.find(params[:id].to_i)
  party.destroy
end

#-----Order-------------------------------------------
get '/api/orders' do
  orders = Order.all
  content_type :json
  orders.to_json
end

get '/api/orders/:id' do
  order = Order.find(params[:id].to_i)
  content_type :json
  order.to_json
end

post '/api/orders' do
  order = Order.create(params[:order])
  content_type :json
  order.to_json
end

put '/api/orders/:id' do
  order = Order.find(params[:id].to_i)
  order.update(params[:order])
  content_type :json
  order.to_json
end

patch '/api/orders/:id' do
  order = Order.find(params[:id].to_i)
  order.update(params[:order])
  content_type :json
  order.to_json
end

delete '/api/orders/:i' do
  order = Order.find(params[:id].to_i)
  order.destroy
end


#-----Food--------------------------------------------
get '/api/foods' do
  content_type :json
  foods = Food.all
  foods.to_json
end

get '/api/foods/:id' do
  food = Food.find(params[:id].to_i)
  content_type :json
  food.to_json
end

post '/api/foods' do
  food = Food.create(params[:food])
  content_type :json
  food.to_json
end

put '/api/foods/:id' do
  food = Party.find(params[:id].to_i)
  food.update(params[:food])
  content_type :json
  food.to_json
end

patch '/api/foods/:id' do
  food = Food.find(params[:id].to_i)
  food.update(params[:food])
  content_type :json
  food.to_json
end

delete '/api/foods/:id' do
  food = Food.find(params[:id].to_i)
  food.destroy
end

get '/api/parties/:id/receipt' do

end

patch '/api/parties/:id/checkout' do

end

put '/api/parties/:id/checkout' do

end
