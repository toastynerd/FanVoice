require 'spec_helper'

describe "characters/show" do
  before(:each) do
    @character = assign(:character, stub_model(Character,
      :name => "Name",
      :bio => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
