class Director < ApplicationRecord
  has_many :films

  validates :first_name, presence: true, length: { maximum: 150 }
  validates :last_name, presence: true, length: { maximum: 150 }
  validates :birthday, presence: true
  validates :bio, presence: true, length: { maximum: 1000 }
  validates :nationality, presence: true, length: { maximum: 150 }
end
