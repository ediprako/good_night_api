# frozen_string_literal: true

class UserFollowsSerializer < ApplicationSerializer
  attributes :id
  attribute :to_user do |object|
    user = object.to_user
    {
      id: user.id,
      name: user.name
    }
  end
end
