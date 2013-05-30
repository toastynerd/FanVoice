require 'spec_helper'
feature "Seed Data" do
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
    user = User.find_by_email!("test@fanvoice.com")
    sign_in_as!(user)
    visit "/"
    page.should have_content("Harry Potter")
  end
end
