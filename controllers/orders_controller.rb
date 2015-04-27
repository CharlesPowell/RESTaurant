class OrdersController < Sinatra::Base
  enable  :sessions

  # ***** Helpers *****
  def order_params
    return params[:order] if params[:order]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['order'] || body_data
  end

  # ***** Routes *****
    get '/' do
      orders = Order.all
      content_type :json
      orders.to_json
    end

    get '/:id' do
      order = Order.find(params[:id].to_i)
      content_type :json
      order.to_json
    end

    post '/' do
      order = Order.create(params[:order])
      party = Party.find_by(id: params[:party_id])
      puts party
      content_type :json
      order.to_json
    end

    put '/:id' do
      order = Order.find(params[:id].to_i)
      order.update(params[:order])
      content_type :json
      order.to_json
    end

    patch '/:id' do
      order = Order.find(params[:id].to_i)
      order.update(params[:order])
      content_type :json
      order.to_json
    end

    delete '/:id' do
      order = Order.find(params[:id].to_i)
      order.destroy
    end

end
