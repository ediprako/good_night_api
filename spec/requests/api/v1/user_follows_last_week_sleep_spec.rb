require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /user/follows/last_week_activity" do
    context 'success response' do
      let(:from_user) {create :user}
      let(:to_user) { create :user}
      let(:sleeps) do
        time = 1.weeks.ago
        5.times do |i|
          date = time + i.days
          create :sleep, user: to_user, date: date, clock_in: date, clock_out: date + 5.hours
        end
      end
      let(:follows) { create :follow, from_user: from_user, to_user: to_user }
      let(:headers) do
        {
          'Authorization': from_user.access_token
        }
      end

      before do
        follows
        sleeps
        get last_week_activity_api_v1_follows_path, headers: headers
      end

      it 'should response ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'should show sleep friends activity' do
        expect(data.count).to eq(5)
      end
    end
  end
end
