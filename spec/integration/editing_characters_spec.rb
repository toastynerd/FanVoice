require 'spec_helper'
feature "Editing characters" do
  let!(:source_material) { Factory(:source_material) }
  let!(:character) { Factory(:character, :source_material => source_material) }
  before do
    visit '/'
    click_link source_material.title
    click_link character.name
    click_link "Edit Character"
end
  scenario "Updating a character" do
    fill_in "Name", :with => "Cersei"
    click_button "Update Character"
    page.should have_content "Character has been updated."
    within("#character h2") do
      page.should have_content("Cersei")
    end
    page.should_not have_content character.name
  end
  scenario "Updating a character with invalid information" do
    fill_in "Name", :with => ""
    click_button "Update Character"
    page.should have_content("Character has not been updated.")
  end
end
