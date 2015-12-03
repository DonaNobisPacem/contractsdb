require 'rails_helper'

RSpec.describe "committee_members/edit", type: :view do
  before(:each) do
    @committee_member = assign(:committee_member, CommitteeMember.create!(
      :member_name => "MyString",
      :leader => false,
      :committee => nil
    ))
  end

  it "renders the edit committee_member form" do
    render

    assert_select "form[action=?][method=?]", committee_member_path(@committee_member), "post" do

      assert_select "input#committee_member_member_name[name=?]", "committee_member[member_name]"

      assert_select "input#committee_member_leader[name=?]", "committee_member[leader]"

      assert_select "input#committee_member_committee_id[name=?]", "committee_member[committee_id]"
    end
  end
end
