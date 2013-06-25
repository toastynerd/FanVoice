require 'spec_helper'
describe CharactersController do
  let(:user) { Factory(:confirmed_user) }
  let(:source_material) { Factory(:source_material) }
  let(:character) { Factory(:character, :source_material => source_material,
                                  :user => user) }
  context "standard users" do
    it "cannot access a character for a source_material" do
      sign_in(:user, user)
      get :show, :id => character.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The source_material you were looking for could not be found.")
    end

    context "with permission to view the source_material" do
      before do
        sign_in(:user, user)
        define_permission!(user, "view", source_material)
      end

      def cannot_create_characters!
        response.should redirect_to(root_path)
        message = "You cannot create characters on this source_material."
        flash[:alert].should eql(message)
      end

      def cannot_update_characters!
        response.should redirect_to(root_path)
        flash[:alert].should eql("You cannot edit characters on this source_material.")
      end

      it "cannot begin to create a character" do
        get :new, 
        cannot_create_characters!
      end

      it "cannot create a character without permission" do
        post :create, 
        cannot_create_characters!
      end

      it "cannot edit a character without permission" do
        get :edit, { :id => character.id }
        cannot_update_characters!
      end

      it "cannot update a character without permission" do
        put :update, { 
                       :id => character.id,
                       :character => {}
                     }
        cannot_update_characters!
      end

      it "cannot delete a character without permission" do
        delete :destroy, { :id => character.id }
        response.should redirect_to(root_path)
        message = "You cannot delete characters from this source_material."
        flash[:alert].should eql(message)
      end
    end
  end
end
