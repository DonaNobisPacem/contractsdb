require 'rails_helper'

RSpec.describe "parties/show", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!(
      :party_name => "Party Name",
      :external => false,
      :contract => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Party Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
