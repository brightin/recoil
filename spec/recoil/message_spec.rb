require 'recoil/message'
require 'spec_helper'

RSpec.describe Recoil::Message do
  it 'receives a SubscriptionConfirmation' do
    message = described_class.for('Type' => 'SubscriptionConfirmation')
    expect(message).to be_a(Recoil::Message::SubscriptionConfirmation)
  end

  it 'receives a Notification' do
    message = described_class.for('Type' => 'Notification')
    expect(message).to be_a(Recoil::Message::Notification)
  end

  it 'receives an UnsubscribeConfirmation' do
    message = described_class.for('Type' => 'UnsubscribeConfirmation')
    expect(message).to be_a(Recoil::Message::UnsubscribeConfirmation)
  end

  it 'receives an unknown message' do
    expect {
      described_class.for('Type' => 'test')
    }.to raise_error(Recoil::Message::TypeUnknown)
  end
end
