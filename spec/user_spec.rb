require 'spec_helper'

describe Imified::User do

  context "when looking for all of the bot's users" do

    # TODO: Get Rspec have_tag or have_selector matcher working.
    it "should have a count of all of the bots users" do
      Imified::User.all.should include "<users count=\"1\">"
    end

    it "should list all of the users"
  end

end
