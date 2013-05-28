require 'spec_helper'

describe SourceMaterialsController do
  let(:user) { Factory(:confirmed_user) }
  let(:source_material) { Factory(:source_material) }
 context "standard users" do
    before do
      sign_in(:user, user)
    end

{ :new => :get,
  :create => :post,
  :edit => :get,
  :update => :put,
  :destroy => :delete }.each do |action, method|
  it "cannot access the #{action} action" do
  sign_in(:user, user)
  send(method, action, :id => source_material.id)
  response.should redirect_to(root_path)
    flash[:alert].should eql("You must be an admin to do that.")
  end
  it "cannot access the show action without permission" do
  sign_in(:user, user)
  get :show, :id => source_material.id
  response.should redirect_to(source_materials_path)
  flash[:alert].should eql("The source_material you were looking for could not be found.")
  end
end
end

  it "displays an error for a missing source_material" do
    sign_in(:user, user)
    get :show, :id => "not-here"
    response.should redirect_to(source_materials_path)
    message = "The source_material you were looking for could not be found."
    flash[:alert].should == message
  end
end
