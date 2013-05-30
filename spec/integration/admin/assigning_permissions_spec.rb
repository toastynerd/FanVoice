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
end
