class User < ApplicationRecord
  validates :username, presence: true, length: {in: 2..10}, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :bio, presence: true, length: {maximum: 500}
end
