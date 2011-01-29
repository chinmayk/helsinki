require 'spec_helper'

describe "adapted_pages/new.html.erb" do
  before(:each) do
    assign(:adapted_page, stub_model(AdaptedPage,
      :url => "MyText"
    ).as_new_record)
  end

  it "renders new adapted_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => adapted_pages_path, :method => "post" do
      assert_select "textarea#adapted_page_url", :name => "adapted_page[url]"
    end
  end
end
