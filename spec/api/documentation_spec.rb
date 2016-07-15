require 'spec_helper'

describe Acme::API do
  include Rack::Test::Methods

  def app
    Acme::API
  end

  context 'swagger documentation root' do
    before do
      get '/api/swagger_doc'
      expect(last_response.status).to eq(200)
      @json = JSON.parse(last_response.body, symbolize_names: true)
    end

    it 'exposes api version' do
      expect(@json[:info][:version]).to eq('0.0.1')
    end
  end

  context 'swagger documentation api' do
    before do
      get '/api/swagger_doc'
      expect(last_response.status).to eq(200)
      @apis = JSON.parse(last_response.body, symbolize_names: true)[:paths]
    end
  end
end
