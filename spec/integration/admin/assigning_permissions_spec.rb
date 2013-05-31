require 'spec_helper'
  feature "Assigning permissions" do
    let!(:admin) { Factory(:admin_user) }
    let!(:user) { Factory(:confirmed_user) }
    let!(:source_material) { Factory(:source_material) }
    let!(:character) { Factory(:character, :source_material => source_material, :user => user) }
    before do
      sign_in_as!(admin)
      click_link "Admin"
      click_link "Users"
      click_link user.email
      click_link "Permissions"
    end
  scenario "Viewing a source_material" do
    check_permission_box "view", source_material
    click_button "Update"
    click_link "Sign out"
    sign_in_as!(user)
    page.should have_content(source_material.title)
  end
  scenario "Creating characters for a source_material" do
    check_permission_box "view", source_material
    check_permission_box "create_characters", source_material
    click_button "Update"
    click_link "Sign out"
    sign_in_as!(user)
    click_link source_material.title
    click_link "New Character"
    fill_in "Name", :with => "Cersei Lannister!"
    fill_in "Bio", :with => "Queen bitch"
    fill_in "Handle", :with => "@cerseiquotes"
    click_button "Create"
    page.should have_content("Character was successfully created.")
  end
  scenario "Updating a character for a source_material" do
    check_permission_box "view", source_material
    check_permission_box "edit_characters", source_material
    click_button "Update"
    click_link "Sign out"
    sign_in_as!(user)
    click_link source_material.title
    click_link character.name
    click_link "Edit Character"
    fill_in "Name", :with => "Tyrion Lannister"
    click_button "Update Character"
    page.should have_content("Character updated.")
  end
 scenario "Deleting a character for a source_material" do
   check_permission_box "view", source_material
   check_permission_box "delete_characters", source_material
   click_button "Update"
   click_link "Sign out"
   sign_in_as!(user)
   click_link source_material.title
   click_link character.name
   click_link "Delete Character"
   page.should have_content("Character has been deleted.")
  end
end
