require 'spec_helper'
feature 'Deleting characters' do
  let!(:source_material) { Factory(:source_material) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:character) do
    character = Factory(:character, :source_material => source_material)
    character.update_attribute(:user, user)
    character
  before do
    sign_in_as!(user)
    visit '/'
    click_link source_material.title
    click_link character.name
  end
  scenario "Deleting a character" do
    click_link "Delete Character"
    page.should have_content("Character has been deleted.")
    page.current_url.should == source_material_url(source_material)
  end
end
