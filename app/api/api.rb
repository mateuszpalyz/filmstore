class API < Grape::API
  prefix 'api'
  mount Login

  rescue_from :all
end
