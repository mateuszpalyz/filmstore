class AuthenticationToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true

  EXPIRES_IN = 30.days

  scope :valid, -> { where('expires_at IS NULL OR expires_at > ?', Time.now) }

  def self.generate(user)
    create(token: SecureRandom.hex(16), expires_at: Time.now + EXPIRES_IN, user: user)
  end
end
