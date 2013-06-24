require 'spec_helper'

feature "edit a tweet" do
  let!(:source_material) {Factory(:source_material)}
  let!(:character) {Factory(:character, :source_material => source_material)}
  let!(:user) {Factory(:admin_user)}
  let!(:tweet) {Factory(:tweet, :character => character)} 

  before do
    sign_in_as!(user)
    visit '/'
    click_link source_material.title
    click_link character.name
  end

  scenario "edit a tweet" do
    within("#tweets ##{tweet.id}") do
      click_link "edit"
    end
    fill_in :body, :with => "some updated tweet"
    click_button "Update Tweet"
    page.should have_content("Tweet has been updated")
  end

end
