require 'rails_helper'

RSpec.describe 'Percepticon API', type: :request do
  let(:good_headline)    { "Trump's Afghan shift praised in Kabul" }
  let(:bad_headline)     { "5 Newspaper Articles From History You'll Swear I'm Making Up" }
  let(:invalid_headline) { " " }

  describe 'GET /scores/new' do
    context 'valid request' do
      let(:json) { JSON.parse(response.body) }

      before(:each) do
        get "/scores/new", params: { title: good_headline }
      end

      it 'responds successfully' do
        expect(response).to be_success
      end

      it 'returns a JSON object with vectors' do
        expect(json['result']).to be(0)
      end
    end

    context 'invalid request' do
      let(:json) { JSON.parse(response.body) }

      before(:each) do
        get "/scores/new", params: { title: invalid_headline }
      end

      it 'responds successfully' do
        expect(response).to be_success
      end

      it 'returns a JSON object with a status error' do
        expect(json['status']).to eq ("error")
      end

      it 'rerurns a JSON object with an error message' do
        expect(json['message']).to eq("invalid query string")
      end
    end
  end
end
