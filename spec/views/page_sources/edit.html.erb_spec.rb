require 'spec_helper'

describe "page_sources/edit.html.erb" do
  before(:each) do
    @page_source = assign(:page_source, stub_model(PageSource,
      :url => "MyString",
      :links_path => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit page_source form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => page_source_path(@page_source), :method => "post" do
      assert_select "input#page_source_url", :name => "page_source[url]"
      assert_select "input#page_source_links_path", :name => "page_source[links_path]"
      assert_select "textarea#page_source_description", :name => "page_source[description]"
    end
  end
end
