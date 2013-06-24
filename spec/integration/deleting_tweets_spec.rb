require "spec_helper"

feature "delete a tweet" do
  let!(:source_material) {Factory(:source_material)}
  let!(:character) {Factory(:character, :source_material => source_material)}
  let!(:tweet) {Factory(:tweet, :character => character)}
  let!(:user) {Factory(:admin_user)}

  before do
    sign_in_as!(user)
    visit '/'
    click_link source_material.title
    click_link character.name
  end

  scenario "be able to delete a tweet" do
    within("#tweets ##{tweet.id}") do
      click_link "destroy"
    end
    page.should have_content("Tweet has been destroyed")
  end
end
