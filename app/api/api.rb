class API < Grape::API
  prefix 'api'
  mount Login
  mount Register
  mount Films
  mount Rates

  rescue_from :all
end
