require 'spec_helper'

describe Imified do
  it "should know the users bot key" do
    Imified::BOTKEY.should_not be_nil
  end

  it "should know the account name" do
    Imified::USERNAME.should_not be_nil
  end

  it "should know the account password" do
    Imified::PASSWORD.should_not be_nil
  end

  it "should know the Imified URL" do
    Imified::IMIFIED_URL.should eql(URI.parse('https://www.imified.com/api/bot/'))
  end
end
