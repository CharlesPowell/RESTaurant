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
  
  get '/api/parties' do
    parties = Party.all
    content_type :json
    parties.to_json
  end

  get '/api/parties/:id' do
    party = Party.find(params[:id].to_i)
    content_type :json
    party.to_json(include: :orders)
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

  get '/api/parties/:id/receipt' do
    party = Party.find(params[:id].to_i)

    #File.write('/path/to/file', 'Some glorious content')
  end

  patch '/api/parties/:id/checkout' do
    party = Party.find(params[:id].to_i)
    party.update(payed: true)
    content_type :json
    party.to_json
  end

  put '/api/parties/:id/checkout' do
    party = Party.find(params[:id].to_i)
    party.update(payed: true)
    content_type :json
    party.to_json
  end
end
