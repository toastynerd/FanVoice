require 'spec_helper'
feature "Viewing source materials" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:source_material) { Factory(:source_material) }

  before do
    sign_in_as!(user)
    define_permission!(user, :view, source_material)
  end

  scenario "Listing all source materials" do
    visit '/'
    click_link source_material.title
    page.current_url.should == source_material_url(source_material)
  end
end
