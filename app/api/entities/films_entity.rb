module Entities
  class FilmsEntity < Grape::Entity
    expose :title, :released_at, :director_id
  end
end
