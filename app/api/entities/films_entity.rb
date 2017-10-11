module Entities
  class FilmsEntity < Grape::Entity
    expose :id, :title, :released_at, :director_name

    private

    def director_name
      "#{object.director.first_name} #{object.director.last_name}"
    end
  end
end
