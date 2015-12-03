require 'rails_helper'

RSpec.describe "parties/new", type: :view do
  before(:each) do
    assign(:party, Party.new(
      :party_name => "MyString",
      :external => false,
      :contract => nil
    ))
  end

  it "renders new party form" do
    render

    assert_select "form[action=?][method=?]", parties_path, "post" do

      assert_select "input#party_party_name[name=?]", "party[party_name]"

      assert_select "input#party_external[name=?]", "party[external]"

      assert_select "input#party_contract_id[name=?]", "party[contract_id]"
    end
  end
end
