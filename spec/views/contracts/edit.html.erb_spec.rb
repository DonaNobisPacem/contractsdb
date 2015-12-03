require 'rails_helper'

RSpec.describe "contracts/edit", type: :view do
  before(:each) do
    @contract = assign(:contract, Contract.create!(
      :contract_type => 1,
      :objectives => "MyText"
    ))
  end

  it "renders the edit contract form" do
    render

    assert_select "form[action=?][method=?]", contract_path(@contract), "post" do

      assert_select "input#contract_contract_type[name=?]", "contract[contract_type]"

      assert_select "textarea#contract_objectives[name=?]", "contract[objectives]"
    end
  end
end
