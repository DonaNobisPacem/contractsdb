require 'rails_helper'

RSpec.describe "contract_types/show", type: :view do
  before(:each) do
    @contract_type = assign(:contract_type, ContractType.create!(
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
