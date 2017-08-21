require 'rails_helper'

RSpec.describe 'Percepticon API', type: :request do
  let(:headline) { "5 Newspaper Articles From History You'll Swear I'm Making Up" }

  describe 'GET /scores/new' do
    it 'returns a JSON object with vectors' do
      get "/scores/new/?title=#{headline}"
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['result']).to be(1)
    end
  end
end
