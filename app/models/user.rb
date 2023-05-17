# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sleeps

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
