require 'spec_helper'

feature "edit a source" do
  let!(:source) {Factory(:source_material)}

  before do
    sign_in_as!(Factory(:admin_user))
    visit '/'
    click_link source.title
    click_link "Edit Source"
  end

  scenario "updating the source material" do
    fill_in "Title", :with => "Something else"
    click_button "Update Source material"
    page.should have_content("Source material has been updated.")
  end

  scenario "can't update with bad data" do
    fill_in "Title", :with => ""
    click_button "Update Source material"
    page.should have_content("Could not update source")
    page.should have_content("can't be blank")
  end
end
