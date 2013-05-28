require 'spec_helper'
feature "hidden links" do
  let(:user) { Factory(:confirmed_user) }
  let(:admin) { Factory(:admin_user) }
  let(:source_material) { Factory(:source_material) }
  context "anonymous users" do
    scenario "cannot see the New Source Material link" do
      visit '/'
      assert_no_link_for "New Source Material"
    end
    scenario "cannot see the Edit Source Material link" do
      visit source_material_path(source_material)
      assert_no_link_for "Edit Source Material"
    end

    scenario "cannot see the Delete Source Material link" do
      visit source_material_path(source_material)
      assert_no_link_for "Delete Source Material"
    end
  end
  context "regular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Source Material link" do
      visit '/'
      assert_no_link_for "New Source Material"
    end
    scenario "cannot see the Edit Source Material link" do
      visit source_material_path(source_material)
      assert_no_link_for "Edit Source Material"
    end

    scenario "cannot see the Delete Source Material link" do
      visit source_material_path(source_material)
      assert_no_link_for "Delete Source Material"
    end
  end
  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the New Source Material link" do
      visit '/'
      assert_link_for "New Source Material"
    end

    scenario "can see the Edit Source Material link" do
      visit source_material_path(source_material)
      assert_link_for "Edit Source Material"
    end

    scenario "can see the Delete Source Material link" do
      visit source_material_path(source_material)
      assert_link_for "Delete Source Material"
    end
  end
end
