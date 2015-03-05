require 'spec_helper'
require 'rack/test'
require 'recoil/endpoint'

RSpec.describe Recoil::Endpoint do
  include Rack::Test::Methods

  def app
    described_class
  end

  it 'returns a 204 head' do
    post '/ses', { 'Type' => 'UnsubscribeConfirmation' }.to_json
    expect(last_response.status).to eq 204
  end

  it 'processes the correct message type' do
    expect_any_instance_of(Recoil::Message::UnsubscribeConfirmation)
      .to receive(:process!)
    post '/ses', { 'Type' => 'UnsubscribeConfirmation' }.to_json
  end
end
