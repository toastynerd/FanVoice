require 'spec_helper'
feature 'Deleting characters' do
  let!(:source_material) { Factory(:source_material) }
  let!(:character) { Factory(:character, :source_material => source_material) }
  before do
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
