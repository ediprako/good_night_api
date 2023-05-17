# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe 'associations' do
    it { should belong_to(:from_user) }
    it { should belong_to(:to_user) }
  end
end
