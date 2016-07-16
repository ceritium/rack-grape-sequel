module Acme
  class Ping < Grape::API
    format :json
    get '/ping' do
      res = DB[:debits]
        .select{DATE_FORMAT(send_at, '%Y%m').as(date)}
        .select_append{sum(amount).as(amount_sum)}
        .group{date}
      res.to_a
    end
  end
end
