module Acme
  class Ping < Grape::API
    format :json

    desc 'Get all kittens!' do
      detail 'this will expose all the kittens'
    end

    params do
      optional :since_at, type: Date, documentation: { param_type: 'query' }
      optional :until_at, type: Date, documentation: { param_type: 'query' }
    end

    get '/debits' do
      res = DB[:debits]
        .select{DATE_FORMAT(send_at, '%Y%m').as(date)}
        .select_append{sum(amount).as(amount_sum)}
        .group{date}

      since_at = params[:since_at]
      if since_at.present?
        res = res.where{send_at > since_at << 1}
      end

      until_at = params[:until_at]
      if until_at.present?
        res = res.where{send_at < until_at << 1}
      end

      res.to_a
    end
  end
end
