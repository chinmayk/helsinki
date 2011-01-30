require "spec_helper"

describe PageSourcesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/page_sources" }.should route_to(:controller => "page_sources", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/page_sources/new" }.should route_to(:controller => "page_sources", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/page_sources/1" }.should route_to(:controller => "page_sources", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/page_sources/1/edit" }.should route_to(:controller => "page_sources", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/page_sources" }.should route_to(:controller => "page_sources", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/page_sources/1" }.should route_to(:controller => "page_sources", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/page_sources/1" }.should route_to(:controller => "page_sources", :action => "destroy", :id => "1")
    end

  end
end
