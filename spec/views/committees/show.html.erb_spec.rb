require 'rails_helper'

RSpec.describe "committees/show", type: :view do
  before(:each) do
    @committee = assign(:committee, Committee.create!(
      :committee_name => "Committee Name",
      :responsibilities => "MyText",
      :contract => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Committee Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
