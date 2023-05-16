# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Auths', type: :request do
  describe 'POST /login' do
    let(:user) { FactoryBot.create :user }
    describe 'success response' do
      context 'valid name'
      before do
        user
      end

      let(:params) do
        {
          name: user.name
        }
      end

      it 'should return access token' do
        post api_v1_auth_path, params: params
        json = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(json.dig('data', 'access_token')).to eq(user.access_token)
      end
    end
  end

  describe 'error response' do
    context 'user doesnt exist' do
      let(:params) do
        {
          name: 'john doe'
        }
      end
      it 'should response not found' do
        post api_v1_auth_path, params: params

        json = JSON.parse(response.body)
        expect(response).to have_http_status(:not_found)
        expect(json.dig('error', 'message')).to eq('User not found')
      end
    end
  end
end
