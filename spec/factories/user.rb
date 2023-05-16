# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:access_token) { SecureRandom.urlsafe_base64(nil, false) }
  end
end
