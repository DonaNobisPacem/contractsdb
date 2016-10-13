require 'rails_helper'

RSpec.describe "committees/new", type: :view do
  before(:each) do
    assign(:committee, Committee.new(
      :committee_name => "MyString",
      :responsibilities => "MyText",
      :contract => nil
    ))
  end

  it "renders new committee form" do
    render

    assert_select "form[action=?][method=?]", committees_path, "post" do

      assert_select "input#committee_committee_name[name=?]", "committee[committee_name]"

      assert_select "textarea#committee_responsibilities[name=?]", "committee[responsibilities]"

      assert_select "input#committee_contract_id[name=?]", "committee[contract_id]"
    end
  end
end
