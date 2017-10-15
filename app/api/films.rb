class Films < Grape::API
  helpers ApiHelpers::AuthenticationHelper
  format :json

  desc 'Endpoints for films'
  resource :films do
    before { authenticate! }

    desc 'Retrieve all films for given keyword'
    get do
      newest_films_ids = Film.order('created_at DESC').limit(3).pluck(:id)
      keyword = params[:query].downcase
      films = Film.includes(:director, :rates).joins(:director)
                  .where('lower(films.title) LIKE ? OR lower(directors.first_name) LIKE ? OR lower(directors.last_name) LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
                  .where('films.id NOT IN (?)', newest_films_ids)

      status 200
      present films, with: Entities::FilmsEntity, user_id: current_user.id
    end

    desc 'Retrieve single film'
    params do
      requires :id, type: String, desc: 'Film id'
    end
    get ':id' do
      present Film.find(params[:id]), with: Entities::FilmEntity
    end
  end

  resource :newest_films do
    before { authenticate! }

    desc 'Retrieve last 3 added films'
    get do
      films = Film.includes(:director, :rates).order('created_at DESC').limit(3)

      status 200
      present films, with: Entities::FilmsEntity, user_id: current_user.id
    end
  end
end
