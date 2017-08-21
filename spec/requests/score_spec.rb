require 'rails_helper'

RSpec.describe 'Percepticon API', type: :request do
  let(:headline) { "5 Newspaper Articles From History You'll Swear I'm Making Up" }
  let(:invalid_headline) { " " }

  describe 'GET /scores/new' do
    context 'valid request' do
      it 'returns a JSON object with vectors' do
        get "/scores/new/?title=#{headline}"
        json = JSON.parse(response.body)

        expect(response).to be_success
        expect(json['result']).to be(1)
      end
    end

    context 'invalid request' do
      it 'returns an JSON object with an error message' do
        get "/scores/new?title=#{invalid_headline}"
        json = JSON.parse(response.body)

        expect(json['status']).to be("error")
        expect(json['message']).to be("invalid query string")
      end
    end
  end
end
