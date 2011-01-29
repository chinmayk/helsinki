require "spec_helper"

describe AdaptedPagesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/adapted_pages" }.should route_to(:controller => "adapted_pages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/adapted_pages/new" }.should route_to(:controller => "adapted_pages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/adapted_pages/1" }.should route_to(:controller => "adapted_pages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/adapted_pages/1/edit" }.should route_to(:controller => "adapted_pages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/adapted_pages" }.should route_to(:controller => "adapted_pages", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/adapted_pages/1" }.should route_to(:controller => "adapted_pages", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/adapted_pages/1" }.should route_to(:controller => "adapted_pages", :action => "destroy", :id => "1")
    end

  end
end
