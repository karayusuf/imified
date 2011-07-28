require 'spec_helper'

describe Imified do
  it "should know the users bot key" do
    Imified::BOTKEY.should_not be_nil
  end
end
