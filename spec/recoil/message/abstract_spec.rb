require 'spec_helper'
require 'recoil/message/abstract'

RSpec.describe Recoil::Message::Abstract do
  it 'performs a http get on the url' do
    expect {
      described_class.new({}).process!
    }.to raise_error(NotImplementedError)
  end
end
