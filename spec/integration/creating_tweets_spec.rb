require 'spec_helper'

feature "creating a tweet" do
  let!(:source_material) {Factory(:source_material)}
  let!(:character) {Factory(:character, :source_material => source_material)}
  let!(:user) {Factory(:admin_user)}

  before do
    sign_in_as!(Factory(:admin_user))
    visit '/'
    click_link source_material.title
    click_link character.name
    click_link "New Tweet"
  end

  scenario "create a new tweet" do
    fill_in "Body", :with => "Here is a new tweet"
    click_button "Create Tweet"
    page.should have_content("Tweet Scheduled!")
  end
end

