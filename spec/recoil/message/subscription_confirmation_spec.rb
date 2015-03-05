require 'spec_helper'
require 'recoil/message/subscription_confirmation'

RSpec.describe Recoil::Message::SubscriptionConfirmation, :vcr do
  it 'performs a http get on the url' do
    message = {
      'SubscribeURL' => 'https://example.com'
    }
    result = described_class.new(message).process!
    expect(result).to include('Example Domain')
  end
end
