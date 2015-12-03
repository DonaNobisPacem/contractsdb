require 'rails_helper'

RSpec.describe "physical_scopes/new", type: :view do
  before(:each) do
    assign(:physical_scope, PhysicalScope.new(
      :address => "MyString",
      :land_area => "9.99",
      :boundaries => "MyText",
      :use_of_premises => "MyText",
      :contract => nil
    ))
  end

  it "renders new physical_scope form" do
    render

    assert_select "form[action=?][method=?]", physical_scopes_path, "post" do

      assert_select "input#physical_scope_address[name=?]", "physical_scope[address]"

      assert_select "input#physical_scope_land_area[name=?]", "physical_scope[land_area]"

      assert_select "textarea#physical_scope_boundaries[name=?]", "physical_scope[boundaries]"

      assert_select "textarea#physical_scope_use_of_premises[name=?]", "physical_scope[use_of_premises]"

      assert_select "input#physical_scope_contract_id[name=?]", "physical_scope[contract_id]"
    end
  end
end
