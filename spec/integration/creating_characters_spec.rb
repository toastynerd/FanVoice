require 'spec_helper'

feature "Creating Characters" do
  let!(:source_material) {Factory(:source_material)}
  before do
    sign_in_as!(Factory(:admin_user))
    visit '/'
    click_link source_material.title
    click_link "New Character"
  end

  scenario "Creating a character" do
    fill_in "Name", :with => "Non-standards compliance"
    fill_in "Bio", :with => "My pages are ugly!"
    fill_in "Handle", :with => "shenst1"
    select(source_material.title, :from => "Source material")
    click_button "Create Character"
    page.should have_content("Character was successfully created.")
  end

  scenario "Creating a character without valid attributes fails" do
    click_button "Create Character"
    page.should have_content("Character has not been created.")
    page.should have_content("can't be blank")
  end

end
