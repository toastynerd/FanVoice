require 'spec_helper'
feature "Creating Characters" do
  before do
    Factory(:source_material, :title => "Game of Thrones")
    user = Factory(:user, :email => "test@fanvoice.com")
    user.confirm!

    visit '/'
    click_link "Game of Thrones"
    click_link "New Character"
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", :with => "test@fanvoice.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    within("h2") {page.should have_content("New Character")}
  end
  scenario "Creating a character" do
    fill_in "Name", :with => "Non-standards compliance"
    fill_in "Bio", :with => "My pages are ugly!"
    fill_in "Handle", :with => "shenst1"
    click_button "Create Character"
    page.should have_content("Character was successfully created.")
    within("#character #author") do
      page.should have_content("Created by test@fanvoice.com")
    end
end
  scenario "Creating a character without valid attributes fails" do
    click_button "Create Character"
    page.should have_content("Character has not been created.")
    page.should have_content("Name can't be blank")
    page.should have_content("Bio can't be blank")
    page.should have_content("Handle can't be blank")
  end
end
