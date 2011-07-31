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
    Imified::URL.should eql('https://www.imified.com/api/bot/')
  end

  it "should be able to list all of the bots users" do
    Imified::User.stub!(:all).and_return('list of users')
    Imified::User.should_receive(:all)
    Imified.get_all_users
  end

end
