require 'rails_helper'

RSpec.describe "physical_scopes/show", type: :view do
  before(:each) do
    @physical_scope = assign(:physical_scope, PhysicalScope.create!(
      :address => "Address",
      :land_area => "9.99",
      :boundaries => "MyText",
      :use_of_premises => "MyText",
      :contract => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
