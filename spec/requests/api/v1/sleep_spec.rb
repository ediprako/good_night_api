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

      it 'should response valid sleep data' do
        sleep = user.sleeps.reload.first
        expect(data).to match(
                          id: sleep.id,
                          date: sleep.date.as_json,
                          clock_in: sleep.clock_in.as_json,
                          clock_out: sleep.clock_out.as_json
                        )
      end
    end
  end

  describe 'POST /clock_out' do
    context 'success response' do
      let(:user) { create :user }
      let(:sleep) { create :sleep, :clock_in, user: user}
      let(:headers) do
        {
          'Authorization': user.access_token
        }
      end
      before do
        post api_v1_sleep_clock_out_path(sleep), headers: headers
      end
      it 'should response status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'should not change sleep count' do
        expect(user.sleeps.count).to eq(1)
      end

      it 'should response valid sleep data' do
        sleep.reload
        expect(data).to match(
                          id: sleep.id,
                          date: sleep.date.as_json,
                          clock_in: sleep.clock_in.as_json,
                          clock_out: sleep.clock_out.as_json
                        )
      end
    end
  end
end
