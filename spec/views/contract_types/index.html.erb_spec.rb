require 'rails_helper'

RSpec.describe "contract_types/index", type: :view do
  before(:each) do
    assign(:contract_types, [
      ContractType.create!(
        :description => "Description"
      ),
      ContractType.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of contract_types" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
