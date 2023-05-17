# frozen_string_literal: true

module Request
  module JsonHelper
    def body
      JSON.parse(response.body, symbolize_names: true)
    end

    def data
      body[:data]
    end
  end
end
