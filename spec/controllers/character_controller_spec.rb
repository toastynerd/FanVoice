require 'spec_helper'
describe CharactersController do
  let(:user) { Factory(:confirmed_user) }
  let(:source_material) { Factory(:source_material) }
  let(:character) { Factory(:character, :source_material => source_material,
                                  :user => user) }
  context "standard users" do
    it "cannot access a character for a source_material" do
      sign_in(:user, user)
      get :show, :id => character.id, :source_material_id => source_material.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The source_material you were looking for could not be found.")
    end
  end
end
