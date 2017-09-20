class Film < ApplicationRecord
  belongs_to :user
  belongs_to :director
end
