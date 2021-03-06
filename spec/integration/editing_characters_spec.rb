require 'spec_helper'
feature "Editing characters" do
  let!(:source_material) { Factory(:source_material) }
  let!(:user) { Factory(:admin_user)}
  let!(:character) do
    character = Factory(:character, :source_material => source_material)
    character.update_attribute(:user, user)
    character
  end

  before do
    define_permission!(user, "view", source_material)
    define_permission!(user, "edit characters", source_material)
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
  end

  scenario "Updating a character with invalid information" do
    fill_in "Name", :with => ""
    click_button "Update Character"
    page.should have_content("Character not updated, please check fields.")
  end
end
