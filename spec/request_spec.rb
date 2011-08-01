require 'spec_helper'

describe Imified::Request do
  it "should use the imified url" do
    Imified::Request::URL.should == URI.parse('https://www.imified.com/api/bot/')
  end

  it "should use basic authentication" do
    Imified::Request.any_instance.
      should_receive(:basic_auth).
      with('rspec_email_address', 'rspec_password')
    Imified::Request.new
  end

  it "should use the 'getallusers' api method" do
    Imified::Request.any_instance.
      should_receive(:set_form_data).
      with(hash_including({'apimethod' => 'getallusers'}))
    Imified::Request.new
  end

  context "when being submitted" do
    let(:mock_net_http) { double('net_http').as_null_object }
    let(:mock_net_http_success) { double('net_http_success') }

    before(:each) { Net::HTTP.stub!(:new).and_return(mock_net_http) }

    it "should build an HTTP request" do
      Net::HTTP.should_receive(:new).
        with(Imified::Request::URL.host, Imified::Request::URL.port)
      Imified::Request.new.submit
    end

    it "should use ssl" do
      mock_net_http.should_receive(:use_ssl=).with(true)
      Imified::Request.new.submit
    end

    it "should send the request" do
      mock_net_http.should_receive(:start).and_return(mock_net_http_success)
      Imified::Request.new.submit
    end
  end
end
