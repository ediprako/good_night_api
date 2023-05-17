# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:access_token) { SecureRandom.urlsafe_base64(nil, false) }

    trait :user_with_clock_in do
      after(:create) do |user|
        10.times do |i|
          time = '2023-05-01'.to_date + i.days
          create :sleep, user: user, date: time, clock_in: time, clock_out: time + 5.hours
        end
      end
    end
  end
end
