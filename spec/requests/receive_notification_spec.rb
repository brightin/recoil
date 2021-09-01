require 'spec_helper'

RSpec.describe 'Receive notification', type: :request do
  it 'adds notifications to the database' do
    message = { "notificationType" => "Bounce", "bounce" => { "bounceSubType" => "Undetermined", "bounceType" => "Undetermined", "bouncedRecipients" => [{"emailAddress" => "example@example.com"}], "timestamp" => "2015-03-05T13:36:37.000Z", "feedbackId" => "ID" }, "mail" => { "timestamp" => "2015-03-05T13:36:34.000Z", "destination" => ["example@example.com"], "messageId" => "ID", "source" => "SES"} }.to_json
    body = {
      'Type' => 'Notification',
      'MessageId' => 'id',
      'TopicArn' => 'arn:aws:sns:',
      'Message' => message,
      'Timestamp' => '2015-03-05T13:36:39.002Z',
      'SignatureVersion' => '1',
      'Signature' => 'Sig',
      'SigningCertURL' => 'https',
      'UnsubscribeURL' => 'https'
    }

    expect {
      post '/ses', params: body.to_json
    }.to change(Recoil::Bounce, :count).by(1)

    expect(Recoil::Bounce.last.email).to eq 'example@example.com'
    expect(Recoil::Bounce.last.bounce_type).to eq 'Undetermined'
  end
end
