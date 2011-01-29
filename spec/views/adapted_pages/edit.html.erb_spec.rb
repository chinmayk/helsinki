require 'spec_helper'

describe "adapted_pages/edit.html.erb" do
  before(:each) do
    @adapted_page = assign(:adapted_page, stub_model(AdaptedPage,
      :url => "MyText"
    ))
  end

  it "renders the edit adapted_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => adapted_page_path(@adapted_page), :method => "post" do
      assert_select "textarea#adapted_page_url", :name => "adapted_page[url]"
    end
  end
end
