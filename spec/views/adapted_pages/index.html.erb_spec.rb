require 'spec_helper'

describe "adapted_pages/index.html.erb" do
  before(:each) do
    assign(:adapted_pages, [
      stub_model(AdaptedPage,
        :url => "MyText"
      ),
      stub_model(AdaptedPage,
        :url => "MyText"
      )
    ])
  end

  it "renders a list of adapted_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
