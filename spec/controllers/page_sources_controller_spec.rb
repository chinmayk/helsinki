require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe PageSourcesController do

  def mock_page_source(stubs={})
    @mock_page_source ||= mock_model(PageSource, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all page_sources as @page_sources" do
      PageSource.stub(:all) { [mock_page_source] }
      get :index
      assigns(:page_sources).should eq([mock_page_source])
    end
  end

  describe "GET show" do
    it "assigns the requested page_source as @page_source" do
      PageSource.stub(:find).with("37") { mock_page_source }
      get :show, :id => "37"
      assigns(:page_source).should be(mock_page_source)
    end
  end

  describe "GET new" do
    it "assigns a new page_source as @page_source" do
      PageSource.stub(:new) { mock_page_source }
      get :new
      assigns(:page_source).should be(mock_page_source)
    end
  end

  describe "GET edit" do
    it "assigns the requested page_source as @page_source" do
      PageSource.stub(:find).with("37") { mock_page_source }
      get :edit, :id => "37"
      assigns(:page_source).should be(mock_page_source)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created page_source as @page_source" do
        PageSource.stub(:new).with({'these' => 'params'}) { mock_page_source(:save => true) }
        post :create, :page_source => {'these' => 'params'}
        assigns(:page_source).should be(mock_page_source)
      end

      it "redirects to the created page_source" do
        PageSource.stub(:new) { mock_page_source(:save => true) }
        post :create, :page_source => {}
        response.should redirect_to(page_source_url(mock_page_source))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page_source as @page_source" do
        PageSource.stub(:new).with({'these' => 'params'}) { mock_page_source(:save => false) }
        post :create, :page_source => {'these' => 'params'}
        assigns(:page_source).should be(mock_page_source)
      end

      it "re-renders the 'new' template" do
        PageSource.stub(:new) { mock_page_source(:save => false) }
        post :create, :page_source => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested page_source" do
        PageSource.stub(:find).with("37") { mock_page_source }
        mock_page_source.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :page_source => {'these' => 'params'}
      end

      it "assigns the requested page_source as @page_source" do
        PageSource.stub(:find) { mock_page_source(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:page_source).should be(mock_page_source)
      end

      it "redirects to the page_source" do
        PageSource.stub(:find) { mock_page_source(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(page_source_url(mock_page_source))
      end
    end

    describe "with invalid params" do
      it "assigns the page_source as @page_source" do
        PageSource.stub(:find) { mock_page_source(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:page_source).should be(mock_page_source)
      end

      it "re-renders the 'edit' template" do
        PageSource.stub(:find) { mock_page_source(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested page_source" do
      PageSource.stub(:find).with("37") { mock_page_source }
      mock_page_source.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the page_sources list" do
      PageSource.stub(:find) { mock_page_source }
      delete :destroy, :id => "1"
      response.should redirect_to(page_sources_url)
    end
  end

end
