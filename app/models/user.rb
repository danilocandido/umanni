class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar_image
  enum role: { no_admin: 0, admin: 1 }
end
