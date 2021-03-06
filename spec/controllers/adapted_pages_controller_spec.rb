require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe AdaptedPagesController do

  def mock_adapted_page(stubs={})
    @mock_adapted_page ||= mock_model(AdaptedPage, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all adapted_pages as @adapted_pages" do
      AdaptedPage.stub(:all) { [mock_adapted_page] }
      get :index
      assigns(:adapted_pages).should eq([mock_adapted_page])
    end
  end

  describe "GET show" do
    it "assigns the requested adapted_page as @adapted_page" do
      AdaptedPage.stub(:find).with("37") { mock_adapted_page }
      get :show, :id => "37"
      assigns(:adapted_page).should be(mock_adapted_page)
    end
  end

  describe "GET new" do
    it "assigns a new adapted_page as @adapted_page" do
      AdaptedPage.stub(:new) { mock_adapted_page }
      get :new
      assigns(:adapted_page).should be(mock_adapted_page)
    end
  end

  describe "GET edit" do
    it "assigns the requested adapted_page as @adapted_page" do
      AdaptedPage.stub(:find).with("37") { mock_adapted_page }
      get :edit, :id => "37"
      assigns(:adapted_page).should be(mock_adapted_page)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created adapted_page as @adapted_page" do
        AdaptedPage.stub(:new).with({'these' => 'params'}) { mock_adapted_page(:save => true) }
        post :create, :adapted_page => {'these' => 'params'}
        assigns(:adapted_page).should be(mock_adapted_page)
      end

      it "redirects to the created adapted_page" do
        AdaptedPage.stub(:new) { mock_adapted_page(:save => true) }
        post :create, :adapted_page => {}
        response.should redirect_to(adapted_page_url(mock_adapted_page))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved adapted_page as @adapted_page" do
        AdaptedPage.stub(:new).with({'these' => 'params'}) { mock_adapted_page(:save => false) }
        post :create, :adapted_page => {'these' => 'params'}
        assigns(:adapted_page).should be(mock_adapted_page)
      end

      it "re-renders the 'new' template" do
        AdaptedPage.stub(:new) { mock_adapted_page(:save => false) }
        post :create, :adapted_page => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested adapted_page" do
        AdaptedPage.stub(:find).with("37") { mock_adapted_page }
        mock_adapted_page.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :adapted_page => {'these' => 'params'}
      end

      it "assigns the requested adapted_page as @adapted_page" do
        AdaptedPage.stub(:find) { mock_adapted_page(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:adapted_page).should be(mock_adapted_page)
      end

      it "redirects to the adapted_page" do
        AdaptedPage.stub(:find) { mock_adapted_page(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(adapted_page_url(mock_adapted_page))
      end
    end

    describe "with invalid params" do
      it "assigns the adapted_page as @adapted_page" do
        AdaptedPage.stub(:find) { mock_adapted_page(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:adapted_page).should be(mock_adapted_page)
      end

      it "re-renders the 'edit' template" do
        AdaptedPage.stub(:find) { mock_adapted_page(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested adapted_page" do
      AdaptedPage.stub(:find).with("37") { mock_adapted_page }
      mock_adapted_page.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the adapted_pages list" do
      AdaptedPage.stub(:find) { mock_adapted_page }
      delete :destroy, :id => "1"
      response.should redirect_to(adapted_pages_url)
    end
  end

end
