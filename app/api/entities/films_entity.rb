module Entities
  class FilmsEntity < Grape::Entity
    expose :id, :title, :released_at, :director_name, :user_rate

    private

    def director_name
      "#{object.director.first_name} #{object.director.last_name}"
    end

    def user_rate
      object.rates.find_by(user_id: options[:user_id])&.value
    end
  end
end
