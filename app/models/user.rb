class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :password_confirmation
  before_save :keys

  has_secure_password

  def keys
    self.api_key = SecureRandom.hex
  end
end
