require 'spec_helper'
require 'recoil/message/notification'

RSpec.describe Recoil::Message::Notification do
  it 'performs a http get on the url' do
    message = {
      'Type' => 'Notification',
      'MessageId' => 'id',
      'TopicArn' => 'arn:aws:sns:',
      'Message' => "{\"notificationType\":\"Bounce\",\"bounce\":{\"bounceSubType\":\"Undetermined\",\"bounceType\":\"Undetermined\",\"bouncedRecipients\":[{\"emailAddress\":\"example@example.com\"}],\"timestamp\":\"2015-03-05T13:36:37.000Z\",\"feedbackId\":\"ID\"},\"mail\":{\"timestamp\":\"2015-03-05T13:36:34.000Z\",\"destination\":[\"example@example.com\"],\"messageId\":\"ID\",\"source\":\"SES\"}}",
      'Timestamp' => '2015-03-05T13:36:39.002Z',
      'SignatureVersion' => '1',
      'Signature' => 'Sig',
      'SigningCertURL' => 'https',
      'UnsubscribeURL' => 'https'
    }
    expect(Recoil::Bounce).to receive(:create!).with(
      email: 'example@example.com',
      bounce_type: 'Undetermined'
    )
    result = described_class.new(message).process!
  end
end
