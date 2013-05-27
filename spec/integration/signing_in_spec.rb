require 'spec_helper'

feature 'Signing in' do
  before do
    Factory(:user, :email => "test@fanvoice.com")
  end

  scenario 'Signing in via confirmation' do
    open_email "test@fanvoice.com", :with_subject => /Confirmation/
    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed.")
    page.should have_content("Signed in as test@fanvoice.com")
  end
  scenario 'Signing in via form' do
    User.find_by_email('test@fanvoice.com').confirm!
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end

end
