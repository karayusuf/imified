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
