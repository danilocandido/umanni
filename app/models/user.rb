class User < ApplicationRecord
  has_one_attached :avatar_image
end
