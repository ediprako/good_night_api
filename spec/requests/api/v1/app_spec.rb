# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'App request', type: :request do
  describe 'GET api/v1/app' do
    context 'success response' do
      it 'should response status with ok' do
        get api_v1_app_path
        json = JSON.parse(response.body)
        expect(json['status']).to eq('ok')
      end
    end
  end
end
