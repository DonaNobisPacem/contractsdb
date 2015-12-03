require 'rails_helper'

RSpec.describe "financial_terms/new", type: :view do
  before(:each) do
    assign(:financial_term, FinancialTerm.new(
      :payer => "MyString",
      :payee => "MyString",
      :amount => "9.99",
      :frequency => "MyString",
      :escalation_rate => "9.99",
      :advance => "9.99",
      :deposit => "9.99",
      :contract => nil
    ))
  end

  it "renders new financial_term form" do
    render

    assert_select "form[action=?][method=?]", financial_terms_path, "post" do

      assert_select "input#financial_term_payer[name=?]", "financial_term[payer]"

      assert_select "input#financial_term_payee[name=?]", "financial_term[payee]"

      assert_select "input#financial_term_amount[name=?]", "financial_term[amount]"

      assert_select "input#financial_term_frequency[name=?]", "financial_term[frequency]"

      assert_select "input#financial_term_escalation_rate[name=?]", "financial_term[escalation_rate]"

      assert_select "input#financial_term_advance[name=?]", "financial_term[advance]"

      assert_select "input#financial_term_deposit[name=?]", "financial_term[deposit]"

      assert_select "input#financial_term_contract_id[name=?]", "financial_term[contract_id]"
    end
  end
end
