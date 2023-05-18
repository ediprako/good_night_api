# frozen_string_literal: true

class Sleep < ApplicationRecord
  belongs_to :user

  after_save :calculate_duration

  def calculate_duration
    return if clock_in.present? || clock_out.present?

    self.duration = (clock_out - clock_in)
  end
end
