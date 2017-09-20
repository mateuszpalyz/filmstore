module Entities
  class FilmEntity < Grape::Entity
    expose :title, :description, :released_at, :director_id
  end
end
