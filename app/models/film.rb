class Film < ApplicationRecord
  belongs_to :user
  belongs_to :director
  has_many :rates

  validates :title, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :released_at, presence: true
end
