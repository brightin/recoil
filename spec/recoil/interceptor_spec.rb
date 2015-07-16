require 'spec_helper'

module Recoil
  RSpec.describe Interceptor do
    FakeMessage = Struct.new(:to)

    describe ".delivering_email" do
      it 'does send all email' do
        message = FakeMessage.new(['example@example.com', 'example2@example.com'])
        Interceptor.delivering_email(message)
        expect(message.to).to eq ['example@example.com', 'example2@example.com']
      end

      it 'does not send email which are blacklisted' do
        message = FakeMessage.new(['example@example.com', 'example2@example.com'])

        email_instance = double(:email, blacklisted?: true)
        email_instance2 = double(:email, blacklisted?: false)

        allow(Email).to receive(:new).with('example@example.com') { email_instance }
        allow(Email).to receive(:new).with('example2@example.com') { email_instance2 }

        Interceptor.delivering_email(message)

        expect(message.to).to eq ['example2@example.com']
      end
    end
  end
end
