require 'spec_helper'

feature "create a new source material" do
  before do
    visit '/'
    click_link "New Source Material"
  end

  scenario "can create a new source material" do
    fill_in "Title", :with => "Game of thrones."
    fill_in "Genre", :with => "Book, Television Series"
    fill_in "Description", :with => "In the game of thrones you win or die."

    click_button "Create Source material"
    page.should have_content("You created a new source.")
  end

  scenario "should not be able to create source with invalid parameters" do
    fill_in "Title", :with => ""
    fill_in "Genre", :with => ""
    fill_in "Description", :with => ""

    click_button "Create Source material"
    page.should have_content("Could not create source.")
    page.should have_content("Title can't be blank")
    page.should have_content("Genre can't be blank")
    page.should have_content("Description can't be blank")
  end
end