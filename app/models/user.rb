class User < ApplicationRecord
  # making sure the username contains only letters and digits
  validates :username, presence: true, length: {in: 2..10}, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  # making sure the email has an email format
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :bio, presence: true, length: {maximum: 500}
end
