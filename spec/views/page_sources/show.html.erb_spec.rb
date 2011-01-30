require 'spec_helper'

describe "page_sources/show.html.erb" do
  before(:each) do
    @page_source = assign(:page_source, stub_model(PageSource,
      :url => "Url",
      :links_path => "Links Path",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Links Path/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
