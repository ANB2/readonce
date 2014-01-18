require 'spec_helper'

describe "Messages" do
  describe "POST /messages" do
    it "creates a message" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post messages_path, message: { body: 'Test' }
      Message.first.body.should eq 'Test'
    end
  end
end
