class User < ApplicationRecord
  validates :username, presence: true, length: {in: 5..10}
  validates :email, presence: true
  validates :bio, presence: true, length: {maximum: 500}
end
