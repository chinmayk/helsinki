require 'spec_helper'

describe "page_sources/index.html.erb" do
  before(:each) do
    assign(:page_sources, [
      stub_model(PageSource,
        :url => "Url",
        :links_path => "Links Path",
        :description => "MyText"
      ),
      stub_model(PageSource,
        :url => "Url",
        :links_path => "Links Path",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of page_sources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Links Path".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
