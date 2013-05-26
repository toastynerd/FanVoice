require 'spec_helper'

feature "deleting sources" do
  let!(:source) {Factory(:source_material)}

  before do
    visit '/'
    click_link source.title
  end

  scenario "deleting a source material" do
    click_link "Delete Source"
    page.should have_content("Source has been deleted.")

    visit '/'
    page.should_not have_content(source.title)
  end
end
