require 'spec_helper'

describe Imified::User do

  context "when requesting all of the bots users" do
    let(:url) { URI.parse(Imified::URL) }
    let(:net_http) { double('net_http').as_null_object }
    let(:net_http_post) { double('http_post').as_null_object }
    let(:http_success) { Net::HTTPSuccess.new(nil, nil, nil) }
    let(:http_error) { double('http_error').as_null_object }

    before(:each) do
      Net::HTTP.stub(:new).and_return(net_http)
      Net::HTTP::Post.stub(:new).and_return(net_http_post)
    end

    it "should use basic authentication" do
      net_http_post.should_receive(:basic_auth)
                   .with(Imified::USERNAME, Imified::PASSWORD)
      Imified::User.all
    end

    it "should post the imified api method 'getallusers'" do
      net_http_post.
        should_receive(:set_form_data).
        with(hash_including({'apimethod' => 'getallusers'}))
      Imified::User.all
    end

    it "should post the imified botkey" do
      net_http_post.
        should_receive(:set_form_data).
        with(hash_including({'botkey' => Imified::BOTKEY}))
      Imified::User.all
    end

    it "should post to the imified api path" do
      Net::HTTP::Post.should_receive(:new).with(url.path)
      Imified::User.all
    end

    it "should send the request to the imified host and port" do
      Net::HTTP.
        should_receive(:new).
        with(url.host, url.port)
      net_http.should_receive(:start).
        and_return(http_error)
      Imified::User.all
    end

    it "should use ssl" do
      net_http.should_receive(:use_ssl=).with(true)
      Imified::User.all
    end

    context "when the request succeeds" do
      it "should return the response text" do
        net_http.should_receive(:start).and_return(http_success)
        http_success.should_receive(:body)
        Imified::User.all
      end
    end

    context "when the request fails" do
      it "should return the response error" do
        net_http.should_receive(:start).and_return(http_error)
        http_error.should_receive(:error!)
        Imified::User.all
      end
    end
  end
end
