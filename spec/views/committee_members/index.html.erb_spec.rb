require 'rails_helper'

RSpec.describe "committee_members/index", type: :view do
  before(:each) do
    assign(:committee_members, [
      CommitteeMember.create!(
        :member_name => "Member Name",
        :leader => false,
        :committee => nil
      ),
      CommitteeMember.create!(
        :member_name => "Member Name",
        :leader => false,
        :committee => nil
      )
    ])
  end

  it "renders a list of committee_members" do
    render
    assert_select "tr>td", :text => "Member Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
