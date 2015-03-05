require 'spec_helper'

module Recoil
  RSpec.describe Email do
    describe "#blacklisted?" do
      it 'is blackisted depending on the threshold' do
        original_threshold = Recoil.blacklist_threshold

        Recoil.setup do |c|
          c.blacklist_threshold = ->(r) { r.bounces > 3 }
        end

        expect(Email.new(2)).not_to be_blacklisted
        expect(Email.new(4)).to be_blacklisted

        Recoil.setup do |c|
          c.blacklist_threshold = ->(r) { true }
        end
        expect(Email.new(2)).to be_blacklisted
        expect(Email.new(4)).to be_blacklisted

        Recoil.setup do |c|
          c.blacklist_threshold = original_threshold
        end
      end
    end
  end
end
