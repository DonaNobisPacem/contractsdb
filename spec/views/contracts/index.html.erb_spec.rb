require 'rails_helper'

RSpec.describe "contracts/index", type: :view do
  before(:each) do
    assign(:contracts, [
      Contract.create!(
        :contract_type => 1,
        :objectives => "MyText"
      ),
      Contract.create!(
        :contract_type => 1,
        :objectives => "MyText"
      )
    ])
  end

  it "renders a list of contracts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
