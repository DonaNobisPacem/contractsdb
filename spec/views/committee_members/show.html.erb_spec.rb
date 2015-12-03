require 'rails_helper'

RSpec.describe "committee_members/show", type: :view do
  before(:each) do
    @committee_member = assign(:committee_member, CommitteeMember.create!(
      :member_name => "Member Name",
      :leader => false,
      :committee => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Member Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
