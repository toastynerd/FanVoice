require 'spec_helper'
feature "Editing characters" do
  let!(:source_material) { Factory(:source_material) }
  let!(:character) { Factory(:character, :source_material => source_material) }
  before do
    visit '/'
    click_link source_material.title
    click_link character.name
    click_link "Edit character"
end
  scenario "Updating a character" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update character"
    page.should have_content "character has been updated."
    within("#character h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content character.title
  end
  scenario "Updating a character with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update character"
    page.should have_content("character has not been updated.")
end
