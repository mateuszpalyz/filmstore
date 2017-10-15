module Entities
  class FilmsEntity < Grape::Entity
    expose :id, :title, :released_at, :director_name, :rate

    private

    def director_name
      "#{object.director.first_name} #{object.director.last_name}"
    end

    def rate
      object.rates.first.value
    end
  end
end
