class Films < Grape::API
  helpers ApiHelpers::AuthenticationHelper
  format :json

  desc 'Endpoints for films'
  resource :films do
    desc 'Retrieve films'
    get do
      status 200
      present Film.all, with: Entities::FilmsEntity
    end

    desc 'Retrieve single film'
    params do
      requires :id, type: String, desc: 'Film id'
    end
    get ':id' do
      present Film.find(params[:id]), with: Entities::FilmEntity
    end
  end
end
