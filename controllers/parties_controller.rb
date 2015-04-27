class PartiesController < Sinatra::Base
  enable  :sessions

  # ***** Helpers *****
  def party_params
    return params[:party] if params[:party]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['party'] || body_data
  end
  # ***** Routes *****

  get '/' do
    parties = Party.all
    content_type :json
    parties.to_json
  end

  get '/:id' do
    party = Party.find(params[:id].to_i)
    content_type :json
    party.to_json(include: :orders)
  end

  post '/' do
    party = Party.create(params[:party])
    content_type :json
    party.to_json
  end

  put '/:id' do
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json
  end

  patch '/:id' do
    party = Party.find(params[:id].to_i)
    party.update(params[:party])
    content_type :json
    party.to_json
  end

  delete '/:id' do
    party = Party.find(params[:id].to_i)
    party.destroy
  end

  get '/:id/receipt' do
    party = Party.find(params[:id].to_i)

    #File.write('/path/to/file', 'Some glorious content')
  end

  patch '/:id/checkout' do
    party = Party.find(params[:id].to_i)
    party.update(payed: true)
    content_type :json
    party.to_json
  end

  put '/:id/checkout' do
    party = Party.find(params[:id].to_i)
    party.update(payed: true)
    content_type :json
    party.to_json
  end
end
