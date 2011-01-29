require 'spec_helper'

describe "adapted_pages/show.html.erb" do
  before(:each) do
    @adapted_page = assign(:adapted_page, stub_model(AdaptedPage,
      :url => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
