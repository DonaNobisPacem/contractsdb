require 'rails_helper'

RSpec.describe "parties/edit", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!(
      :party_name => "MyString",
      :external => false,
      :contract => nil
    ))
  end

  it "renders the edit party form" do
    render

    assert_select "form[action=?][method=?]", party_path(@party), "post" do

      assert_select "input#party_party_name[name=?]", "party[party_name]"

      assert_select "input#party_external[name=?]", "party[external]"

      assert_select "input#party_contract_id[name=?]", "party[contract_id]"
    end
  end
end
