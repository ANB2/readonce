require 'spec_helper'

describe "Messages" do
  #describe "POST /messages" do
  #  before do
      # not good way to dobut will get test pass
      # user = User.create(email: 'me@example.com', password: 'password'. password_confirmation: 'password')
      # sign_in user
      
      # user = Factory
   #    sign_in create(:user)
      
   #   post messages_path, message: { body: 'Test' }
   # end
  
      
 #   it "creates a message" do
 #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
 #     
 #     Message.first.body.should eq 'Test'
 #   end
    
  #  it "redirects to /messages" do
  #    response.status.should eq 302
  #    response.location.should eq messages_url
  #    # one should per it block
  #  end
    
  
  
  describe "creating a message", type: :feature do
    before do
#      visit new_user_registration_path
#      fill_in :user_email, with: 'me@example.com'
#      fill_in :user_password, with: 'password'
#      fill_in :user_password_confirmation, with: 'password'
#      click_button 'Sign up'
      sign_up
    end 
      
      


    it "redirect to the messages index" do
      visit new_message_path
      fill_in :message_body, with: 'Test'
      click_button 'Send'
      page.should have_content 'Test'
      # page.current_path '/messages'
    end
    
    context 'without filling the body field' do # lightweight wrrapper - before - test failure output
      it 'displays an error message' do
        visit new_message_path
        click_button 'Send'
        page.should have_content "can't be blank"
      end
    end
    
  end
  
  describe "viewing a list of messages", type: :feature do
    
    before do
      another_user = create(:user, email: 'another@example.com')
      create(:message, sender: another_user, body: 'Iam not yours')
      sign_up
    end
    
    it "doesn't show other people's messages" do
      visit messages_path
      # page.should have_content "my message"
      page.should_not have_content "I am not yours"
    
    end
  end
    
    def sign_up
      visit new_user_registration_path
      fill_in :user_email, with: 'me@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'
    end  
end
