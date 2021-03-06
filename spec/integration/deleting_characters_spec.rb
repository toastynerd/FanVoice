require 'spec_helper'
feature 'Deleting characters' do
  let!(:source_material) { Factory(:source_material) }
  let!(:user) { Factory(:admin_user) }
  let!(:character) do
    character = Factory(:character, :source_material => source_material)
    character.update_attribute(:user, user)
    character
  end

  before do
    define_permission!(user, "view", source_material)
    define_permission!(user, "delete characters", source_material)
    sign_in_as!(user)
    visit '/'
    click_link source_material.title
    click_link character.name
  end

  scenario "Deleting a character" do
    click_link "Delete Character"
    page.should have_content("Character has been deleted.")
  end
end
