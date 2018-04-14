# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name 'Example User'
    sequence(:email) { |n| "user#{n}@example.net" }
    sequence(:username) { |n| "user#{n}" }
    password 'foobar'
    password_confirmation 'foobar'
  end
end
