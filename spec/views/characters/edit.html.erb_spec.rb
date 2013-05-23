require 'spec_helper'

describe "characters/edit" do
  before(:each) do
    @character = assign(:character, stub_model(Character,
      :name => "MyString",
      :bio => "MyText"
    ))
  end

  it "renders the edit character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", character_path(@character), "post" do
      assert_select "input#character_name[name=?]", "character[name]"
      assert_select "textarea#character_bio[name=?]", "character[bio]"
    end
  end
end
