require 'spec_helper'

feature "Viewing Characters" do
  before do
    game = Factory(:source_material, :title => "Game of Thrones")
    Factory(:character, :source_material => game, :name => "Cersei Lannister",
      :bio => "Queen bitch", :handle => "cerseiquotes")
    harry = Factory):source_material, :title => "Harry Potter")
    Factory(:character, :source_material => harry, :name => "Hermione Granger",
      :bio => "aka Emma Watson" :handle => "hermionequotes")

    visit '/'
  end

  scenario "Viewing characters for a given source" do
    click_link "Game of Thrones"
    page.should have_content("Cersei Lannister")
    page.should_not have_content("Hermione Granger")

    click_link "Cersei Lannister"
    within("#character h2") do
      page.should have_content("Cersei Lannister")
    end
    page.should have_content("Queen bitch")
  end
end
