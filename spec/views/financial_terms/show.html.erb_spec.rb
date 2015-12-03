require 'rails_helper'

RSpec.describe "financial_terms/show", type: :view do
  before(:each) do
    @financial_term = assign(:financial_term, FinancialTerm.create!(
      :payer => "Payer",
      :payee => "Payee",
      :amount => "9.99",
      :frequency => "Frequency",
      :escalation_rate => "9.99",
      :advance => "9.99",
      :deposit => "9.99",
      :contract => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Payer/)
    expect(rendered).to match(/Payee/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Frequency/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
