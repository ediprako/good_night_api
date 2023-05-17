# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sleeps
  has_many :follows, class_name: 'Follow', foreign_key: 'from_user_id'
  has_many :followers, class_name: 'Follow', foreign_key: 'to_user_id'

  def persist_with_random_token!(attempts = 10)
    retries ||= 0
    self.access_token = SecureRandom.urlsafe_base64(nil, false)
    save!
  rescue ActiveRecord::RecordNotUnique
    raise if (retries += 1) > attempts

    Rails.logger.warn("random token, unlikely collision number #{retries}")
    self.access_token = SecureRandom.urlsafe_base64(16, false)
    retry
  end
end
