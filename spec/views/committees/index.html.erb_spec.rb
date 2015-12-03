require 'rails_helper'

RSpec.describe "committees/index", type: :view do
  before(:each) do
    assign(:committees, [
      Committee.create!(
        :committee_name => "Committee Name",
        :responsibilities => "MyText",
        :contract => nil
      ),
      Committee.create!(
        :committee_name => "Committee Name",
        :responsibilities => "MyText",
        :contract => nil
      )
    ])
  end

  it "renders a list of committees" do
    render
    assert_select "tr>td", :text => "Committee Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
