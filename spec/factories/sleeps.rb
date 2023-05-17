# frozen_string_literal: true

FactoryBot.define do
  factory :sleep do
    user
    date { Date.current }
    trait :clock_in do
      clock_in { Time.current }
    end

    trait :clock_out do
      clock_in { Time.current }
      clock_out { Time.current + 1.hours }
    end
  end
end
