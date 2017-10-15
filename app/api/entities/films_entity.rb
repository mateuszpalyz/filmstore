module Entities
  class FilmsEntity < Grape::Entity
    expose :id, :title, :released_at, :director_name, :image_url, :rate

    private

    def director_name
      "#{object.director.first_name} #{object.director.last_name}"
    end

    def rate
      object.rates.find_by(user_id: options[:user_id])&.value
    end
  end
end
