require 'rails_helper'

RSpec.describe "physical_scopes/index", type: :view do
  before(:each) do
    assign(:physical_scopes, [
      PhysicalScope.create!(
        :address => "Address",
        :land_area => "9.99",
        :boundaries => "MyText",
        :use_of_premises => "MyText",
        :contract => nil
      ),
      PhysicalScope.create!(
        :address => "Address",
        :land_area => "9.99",
        :boundaries => "MyText",
        :use_of_premises => "MyText",
        :contract => nil
      )
    ])
  end

  it "renders a list of physical_scopes" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
