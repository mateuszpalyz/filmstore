class API < Grape::API
  prefix 'api'
  mount Login
  mount Register
  mount Films

  rescue_from :all
end
