# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    from_user { user }
    to_user { user }
  end
end
