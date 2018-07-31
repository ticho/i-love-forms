# frozen_string_literal: true

require 'faker'

10.times do
  User.create(
    username: Faker::GameOfThrones.character,
    email: Faker::Internet.email,
    bio: Faker::GameOfThrones.quote
  )
end