class Films < Grape::API
  helpers ApiHelpers::AuthenticationHelper
  format :json

  desc 'Endpoints for films'
  resource :films do
    before { authenticate! }

    desc 'Retrieve last 3 films rated by current user'
    get do
      films = Film.includes(:director).joins(:rates).where('rates.user_id = ?', current_user.id)
        .order('rates.updated_at DESC').limit(3)

      status 200
      present films, with: Entities::FilmsEntity
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
