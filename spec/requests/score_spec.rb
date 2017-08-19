require 'rails_helper'

RSpec.describe 'Percepticon API', type: :request do
  let(:headline) { "5 Newspaper Articles From History You'll Swear I'm Making Up" }

  it 'sends a messages' do

    get '/scores/new'
      p response.body
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['messages'].length).to eq(1)
  end

end
