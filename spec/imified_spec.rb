require 'spec_helper'

describe Imified do

  it "should know the Imified URL" do
    Imified::URL.should eql('https://www.imified.com/api/bot/')
  end

  context "when the user is specifying their accout information" do
    before(:each) do
      Imified.setup do |config|
        config.botkey = 'my botkey'
        config.email_address = 'my email address'
        config.password = 'my super secret password'
      end
    end

    it "should set the botkey to the specified value" do
      Imified.botkey.should eql('my botkey')
    end

    it "should set the email address to the specified value" do
      Imified.email_address.should eql('my email address')
    end

    it "should set the password to the specified value" do
      Imified.password.should eql('my super secret password')
    end

  end

  context "when fetching a list of the bot's users" do
    let(:mock_request) { double('imified_request').as_null_object }
    let(:mock_response) { double('imfiied_response').as_null_object }

    before(:each) do
      Imified::Request.stub(:new).and_return(mock_request)
      mock_request.stub(:submit).and_return(mock_response)
    end

    it "should prepare a new request" do
      Imified::Request.should_receive(:new)
      Imified.get_all_users
    end

    it "should submit the request" do
      mock_request.should_receive(:submit)
      Imified.get_all_users
    end
  end

end
