module Acme
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::Acme::Ping
    mount ::Acme::RescueFrom
    mount ::Acme::ContentType
    mount ::Acme::PathVersioning
    add_swagger_documentation api_version: 'v1'
  end
end
