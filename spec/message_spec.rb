require 'spec_helper'

describe Imified::Message do

  it "should contain text" do
    message = Imified::Message.new("Text of some kind")
    message.text.should eql("Text of some kind")
  end

end
