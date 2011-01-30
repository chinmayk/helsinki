class AdaptedPagesController < ApplicationController
  
  #FIXME Turn on auth! 
  # before_filter :authenticate_user! 
  
  
  # GET /adapted_pages
  # GET /adapted_pages.xml
  def index
    @adapted_pages = AdaptedPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adapted_pages }
    end
  end

  # GET /adapted_pages/1
  # GET /adapted_pages/1.xml
  def show
    @adapted_page = AdaptedPage.find(params[:id])
    @adapted_page.recognize
    @search_form = nil
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adapted_page }
    end
  end

  # GET /adapted_pages/new
  # GET /adapted_pages/new.xml
  def new
    @adapted_page = AdaptedPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adapted_page }
    end
  end

  # GET /adapted_pages/1/edit
  def edit
    @adapted_page = AdaptedPage.find(params[:id])
  end

  # POST /adapted_pages
  # POST /adapted_pages.xml
  def create
    @adapted_page = AdaptedPage.new(params[:adapted_page])

    respond_to do |format|
      if @adapted_page.save
        format.html { redirect_to(@adapted_page, :notice => 'Adapted page was successfully created.') }
        format.xml  { render :xml => @adapted_page, :status => :created, :location => @adapted_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adapted_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /adapted_pages/1
  # PUT /adapted_pages/1.xml
  def update
    @adapted_page = AdaptedPage.find(params[:id])

    respond_to do |format|
      if @adapted_page.update_attributes(params[:adapted_page])
        format.html { redirect_to(@adapted_page, :notice => 'Adapted page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adapted_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /adapted_pages/1
  # DELETE /adapted_pages/1.xml
  def destroy
    @adapted_page = AdaptedPage.find(params[:id])
    @adapted_page.destroy

    respond_to do |format|
      format.html { redirect_to(adapted_pages_url) }
      format.xml  { head :ok }
    end
  end
  
  def next_page
    session.inspect # force session load
    if session.has_key? "next_page_index"
        next_index = session["next_page_index"] 
    else
        next_index = 0
    end
    
    @adapted_page = AdaptedPage.get_next_page_for(nil, next_index)
    
    session["next_page_index"] = next_index + 1
    unless @adapted_page.nil?
      redirect_to (@adapted_page)
    end
    
    
  end
  
end
