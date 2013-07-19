# require 'spec_helper'
# feature "visiting the dashboard"
#   let!(:user) { Factory(:confirmed_user)}
# # it shows the homepage when visiting for the first time

# scenario "Visiting the homepage for the first time" do
#   visit '/'
#   page.should have_content("Reach an audience")
# end
# scenario "Visiting the homepage logged in redirects to dashboard" do
#   sign_in_as!(user)
#   visit '/'
#   page.should have_content("Dashboard")
# end
# scenario "Visiting a page I don't have permission to" do
#   visit '/source_materials'
#   page.should_not have_content("Source Materials")
# end

