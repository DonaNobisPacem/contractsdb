require 'rails_helper'

RSpec.describe "contracts/new", type: :view do
  before(:each) do
    assign(:contract, Contract.new(
      :contract_type => 1,
      :objectives => "MyText"
    ))
  end

  it "renders new contract form" do
    render

    assert_select "form[action=?][method=?]", contracts_path, "post" do

      assert_select "input#contract_contract_type[name=?]", "contract[contract_type]"

      assert_select "textarea#contract_objectives[name=?]", "contract[objectives]"
    end
  end
end
