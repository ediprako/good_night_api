require 'rails_helper'

RSpec.describe "Api::V1::Sleeps", type: :request do
  describe "POST /clock_in" do
    context 'success response' do
      let(:user) { create :user }
      let(:headers) do
        {
          'Authorization': user.access_token
        }
      end

      before do
        post clock_in_api_v1_sleep_index_path, headers: headers
      end
      it 'should response status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'should change sleep count' do
        expect(user.sleeps.count).to eq(1)
      end
    end
  end
end
