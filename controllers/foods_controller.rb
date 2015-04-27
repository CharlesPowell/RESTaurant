class FoodsController < Sinatra::Base
  enable  :sessions
  helpers Sinatra::SessionHelper

  def food_params
    return params[:food] if params[:food]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['food'] || body_data
  end


  #-----Food--------------------------------------------
  get '/' do
    content_type :json
    foods = Food.all
    foods.to_json
  end

  get '/:id' do
    food = Food.find(params[:id].to_i)
    content_type :json
    food.to_json(include: :parties)
  end

  post '/' do
    authenticate_api!
    food = Food.create(food_params)
    content_type :json
    food.to_json
  end

  put '/:id' do
    authenticate_api!
    food = Food.find(params[:id].to_i)
    food.update(food_params)
    content_type :json
    food.to_json
  end

  patch '/:id' do
    authenticate_api!
    food = Food.find(params[:id].to_i)
    food.update(food_params)
    content_type :json
    food.to_json
  end

  delete '/:id' do
    authenticate_api!
    food = Food.find(params[:id].to_i)
    food.destroy
  end

end
