module Acme
  class Ping < Grape::API
    format :json
    get '/ping' do
      debits = DB[:debits].limit(10)
      { ping: debits.to_a }
    end
  end
end
