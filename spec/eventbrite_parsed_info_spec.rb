require 'spec_helper'

RSpec.describe EventbriteSerializer do
  it 'exists' do
    ebs = EventbriteSerializer.new

    assert_instance_of EventbriteSerializer, ebs
  end
end
