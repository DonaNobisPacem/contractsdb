require 'rails_helper'

RSpec.describe "parties/index", type: :view do
  before(:each) do
    assign(:parties, [
      Party.create!(
        :party_name => "Party Name",
        :external => false,
        :contract => nil
      ),
      Party.create!(
        :party_name => "Party Name",
        :external => false,
        :contract => nil
      )
    ])
  end

  it "renders a list of parties" do
    render
    assert_select "tr>td", :text => "Party Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
