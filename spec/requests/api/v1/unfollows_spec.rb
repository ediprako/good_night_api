require 'rails_helper'

RSpec.describe "Api::V1::Unfollows", type: :request do
  describe "POST /user/:user_id/unfollows" do
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
      post api_v1_user_unfollows_path(to_user), headers: headers
    end

    it 'should response ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should no have user follows' do
      expect(from_user.reload.follows.count).to eq(0)
    end
  end
end
