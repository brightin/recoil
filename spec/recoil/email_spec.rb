require 'spec_helper'

module Recoil
  RSpec.describe Email do
    subject(:email) { Email.new('example@example.com') }

    def create_bounce(created_at = nil)
      Bounce.create!(email: email.to_s, created_at: created_at)
    end

    describe ".blacklisted?" do
      it 'defaults to a blacklist emails with more than 10 bounces in the last two weeks' do
        10.times { create_bounce }
        expect(email).not_to be_blacklisted

        create_bounce(3.weeks.ago)
        create_bounce(3.weeks.ago)

        expect(email).not_to be_blacklisted

        create_bounce
        expect(email).to be_blacklisted
      end

      it 'is configurable via the recoil config' do
        original_threshold = Recoil.blacklist_threshold

        Recoil.blacklist_threshold = ->(scope) { true }
        expect(email).to be_blacklisted

        Recoil.blacklist_threshold = original_threshold
      end
    end
  end
end
