require 'spec_helper'
feature "hidden links" do
  let(:user) { Factory(:confirmed_user) }
  let(:admin) { Factory(:admin_user) }
  let(:source_material) { Factory(:source_material) }
  let!(:character) { Factory(:character, :source_material => source_material, :user => user) }
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
    scenario "New character link is shown to a user with permission" do
      define_permission!(user, "view", source_material)
      define_permission!(user, "create characters", source_material)
      visit source_material_path(source_material)
      assert_link_for "New Character"
    end
    scenario "New character link is hidden from a user without permission" do
      define_permission!(user, "view", source_material)
      visit source_material_path(source_material)
      assert_no_link_for "New Character"
    end
    scenario "Edit character link is shown to a user with permission" do
      define_permission!(user, "view", source_material)
      define_permission!(user, "edit characters", source_material)
      visit source_material_path(source_material)
      click_link character.name
      assert_link_for "Edit Character"
    end
    scenario "Edit character link is hidden from a user without permission" do
     define_permission!(user, "view", source_material)
     visit source_material_path(source_material)
     click_link character.name
     assert_no_link_for "Edit Character"
   end

    scenario "Delete character link is shown to a user with permission" do
      define_permission!(user, "view", source_material)
      define_permission!(user, "delete characters", source_material)
      visit source_material_path(source_material)
      click_link character.name
      assert_link_for "Delete Character"
    end
    scenario "Delete character link is hidden from users without permission" do
      define_permission!(user, "view", source_material)
      visit source_material_path(source_material)
      click_link character.name
      assert_no_link_for "Delete Character"
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
    scenario "New character link is shown to admins" do
      visit source_material_path(source_material)
      assert_link_for "New Character"
    end
    scenario "Edit character link is shown to admins" do
      visit source_material_path(source_material)
      click_link character.name
      assert_link_for "Edit Character"
    end
    scenario "Delete character link is shown to admins" do
      visit source_material_path(source_material)
      click_link character.name
      assert_link_for "Delete Character"
    end
  end
end
