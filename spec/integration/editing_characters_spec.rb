require 'spec_helper'
feature "Editing characters" do
  let!(:source_material) { Factory(:source_material) }
  let!(:user) { Factory(:confirmed_user)}
  let!(:character) do
    character = Factory(:character, :source_material => source_material)
    character.update_attribute(:user, user)
    character
  end

  before do
    define_permission!(user, "view", source_material)
    sign_in_as!(user)
    visit '/'
    click_link source_material.title
    click_link character.name
    click_link "Edit Character"
end
  scenario "Updating a character" do
    fill_in "Name", :with => "Cersei"
    click_button "Update Character"
    page.should have_content "Character updated."
    within("#character h2") do
      page.should have_content("Cersei")
    end
    page.should_not have_content character.name
  end
  scenario "Updating a character with invalid information" do
    fill_in "Name", :with => ""
    click_button "Update Character"
    page.should have_content("Character not updated, please check fields.")
  end
end
