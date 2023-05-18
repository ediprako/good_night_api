require 'rails_helper'

RSpec.describe "Api::V1::Follows", type: :request do
  describe "GET /users/:user_id/follows" do
    context 'success response' do
      let(:from_user) {create :user}
      let(:to_user) { create :user}
      let(:follows) { create :follow, from_user: from_user, to_user: to_user }
      let(:headers) do
        {
          'Authorization': from_user.access_token
        }
      end

      before do
        follows
        get api_v1_follows_path, headers: headers
      end

      it 'should response ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'should response exactly 1 user follows' do
        expect(data.count).to eq(1)
        expect(data.first).to match(
                                id: follows.id,
                                to_user: {
                                  id: to_user.id,
                                  name: to_user.name
                                }
                              )
      end
    end
  end

  describe "POST /users/:user_id/follows" do
    context 'success response' do
      let(:from_user) {create :user}
      let(:to_user) { create :user}
      let(:headers) do
        {
          'Authorization': from_user.access_token
        }
      end

      before do
        post api_v1_user_follows_path(to_user), headers: headers
      end

      it 'should response ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'should response exactly 1 user follows' do
        expect(Follow.count).to eq(1)
      end
    end
  end
end
