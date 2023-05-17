require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /user/:id/sleep_history" do
    context 'success response' do
      let(:user) { create :user, :user_with_clock_in}
      let(:headers) do
        {
          'Authorization': user.access_token
        }
      end

      it 'should response ok' do
        get sleep_history_api_v1_users_path(user), headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'should limit by 1' do
        params = {
          page: 1,
          limit: 1
        }

        expected = {
          id:10,
          date: "2023-05-10",
          clock_in:"2023-05-10T00:00:00.000Z",
          clock_out:"2023-05-10T05:00:00.000Z"
        }

        get sleep_history_api_v1_users_path(user), headers: headers, params: params

        expect(data.count).to eq(1)
        expect(data.first).to match(expected)
      end
    end
  end
end
