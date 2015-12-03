require 'rails_helper'

RSpec.describe "committees/edit", type: :view do
  before(:each) do
    @committee = assign(:committee, Committee.create!(
      :committee_name => "MyString",
      :responsibilities => "MyText",
      :contract => nil
    ))
  end

  it "renders the edit committee form" do
    render

    assert_select "form[action=?][method=?]", committee_path(@committee), "post" do

      assert_select "input#committee_committee_name[name=?]", "committee[committee_name]"

      assert_select "textarea#committee_responsibilities[name=?]", "committee[responsibilities]"

      assert_select "input#committee_contract_id[name=?]", "committee[contract_id]"
    end
  end
end
