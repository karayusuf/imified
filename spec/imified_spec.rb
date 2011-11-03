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

  context "when sending a message to a user" do
    let(:mock_request) { double('imified_request').as_null_object }
    let(:mock_response) { double('imfiied_response').as_null_object }

    before(:each) do
      Imified::Request.stub(:new).and_return(mock_request)
      mock_request.stub(:submit).and_return(mock_response)
    end

    it "should prepare a new request to 'send'" do
      Imified::Request.
        should_receive(:new).
        with('send').
        and_return(mock_request)
      Imified.send_message('Rspec message', :to => 'userkey')
    end

    it "should add the specified message to the request" do
      mock_request.
        should_receive(:add_field).
        with('msg', 'a message to send')
      Imified.send_message('a message to send', :to => 'a user')
    end

    it "should add the specified userkey to the request" do
      mock_request.
        should_receive(:add_field).
        with('userkey', 'someones userkey')
      Imified.send_message('A Message', :to => 'someones userkey')
    end

    it "should lookup the userkey using the specified email" do
      Imified.stub!(:user_list).
        and_return(example_get_all_users_response)
      mock_request.
        should_receive(:add_field).
        with('userkey', '123456789')
      Imified.send_message('A Message', :to => 'me@jkarayusuf.com')
    end

    it "should submit the request" do
      mock_request.should_receive(:submit)
      Imified.send_message('A Message', :to => 'someones userkey')
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

  context "when fetching details for a specified user" do
    let(:mock_request) { double('imified_request').as_null_object }
    let(:mock_response) { double('imified_response').as_null_object }

    before(:each) do
      Imified::Request.stub(:new).and_return(mock_request)
      mock_request.stub(:submit).and_return(mock_response)
    end

    it "should prepare a new request to 'getuser'" do
      Imified::Request.
        should_receive(:new).
        with('getuser')
      Imified.get_user('someones userkey')
    end

    it "should add the specified userkey to the request" do
      mock_request.
        should_receive(:add_field).
        with('userkey', 'someones userkey')
      Imified.get_user('someones userkey')
    end

    it "should submit the request" do
      mock_request.should_receive(:submit)
      Imified.get_user('userkey')
    end
  end

  context "when validating the configuration" do
    it "should not raise an error if all of the values are set" do
      Imified.setup do |config|
        config.botkey = 'botkey'
        config.email_address = 'test email'
        config.password = 'super secret'
      end

      expect { Imified.validate_configuration! }.to_not raise_error(ArgumentError)
    end

    it "should raise an error if the botkey has not been specified" do
      Imified.stub(:botkey).and_return(nil)
      expect { Imified.validate_configuration! }.to raise_error(ArgumentError)
    end

    it "should raise an error if the email address has not been specified" do
      Imified.stub(:email_address).and_return(nil)
      expect { Imified.validate_configuration! }.to raise_error(ArgumentError)
    end

    it "should raise an error if the password has not been specified" do
      Imified.stub(:password).and_return(nil)
      expect { Imified.validate_configuration! }.to raise_error(ArgumentError)
    end
  end
end
