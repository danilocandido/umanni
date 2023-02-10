class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar_image
  enum role: { no_admin: 0, admin: 1 }

  scope :most_recent, -> { order(created_at: :desc) }

  validates :full_name, :email, :role, presence: true
end
