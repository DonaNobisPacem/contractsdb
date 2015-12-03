require 'rails_helper'

RSpec.describe "financial_terms/index", type: :view do
  before(:each) do
    assign(:financial_terms, [
      FinancialTerm.create!(
        :payer => "Payer",
        :payee => "Payee",
        :amount => "9.99",
        :frequency => "Frequency",
        :escalation_rate => "9.99",
        :advance => "9.99",
        :deposit => "9.99",
        :contract => nil
      ),
      FinancialTerm.create!(
        :payer => "Payer",
        :payee => "Payee",
        :amount => "9.99",
        :frequency => "Frequency",
        :escalation_rate => "9.99",
        :advance => "9.99",
        :deposit => "9.99",
        :contract => nil
      )
    ])
  end

  it "renders a list of financial_terms" do
    render
    assert_select "tr>td", :text => "Payer".to_s, :count => 2
    assert_select "tr>td", :text => "Payee".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
