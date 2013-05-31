require 'spec_helper'
feature "Viewing source materials" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:source_material) { Factory(:source_material) }
  let!(:source_material_2) { Factory(:source_material, title: "Harry Potter")}

  before do
    sign_in_as!(user)
    define_permission!(user, :view, source_material)
  end

  scenario "Listing all source materials" do
    visit '/'
    page.should_not have_content("Harry Potter")
    click_link source_material.title
    page.current_url.should == source_material_url(source_material)
  end
end
