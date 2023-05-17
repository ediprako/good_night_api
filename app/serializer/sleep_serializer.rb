# frozen_string_literal: true

class SleepSerializer < ApplicationSerializer
  attributes :id, :date, :clock_in, :clock_out
end
