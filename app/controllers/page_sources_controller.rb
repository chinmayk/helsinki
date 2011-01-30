class PageSourcesController < ApplicationController
  # GET /page_sources
  # GET /page_sources.xml
  def index
    @page_sources = PageSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page_sources }
    end
  end

  # GET /page_sources/1
  # GET /page_sources/1.xml
  def show
    @page_source = PageSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page_source }
    end
  end

  # GET /page_sources/new
  # GET /page_sources/new.xml
  def new
    @page_source = PageSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page_source }
    end
  end

  # GET /page_sources/1/edit
  def edit
    @page_source = PageSource.find(params[:id])
  end

  # POST /page_sources
  # POST /page_sources.xml
  def create
    @page_source = PageSource.new(params[:page_source])

    respond_to do |format|
      if @page_source.save
        format.html { redirect_to(@page_source, :notice => 'Page source was successfully created.') }
        format.xml  { render :xml => @page_source, :status => :created, :location => @page_source }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /page_sources/1
  # PUT /page_sources/1.xml
  def update
    @page_source = PageSource.find(params[:id])

    respond_to do |format|
      if @page_source.update_attributes(params[:page_source])
        format.html { redirect_to(@page_source, :notice => 'Page source was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /page_sources/1
  # DELETE /page_sources/1.xml
  def destroy
    @page_source = PageSource.find(params[:id])
    @page_source.destroy

    respond_to do |format|
      format.html { redirect_to(page_sources_url) }
      format.xml  { head :ok }
    end
  end
  
  def set_source
    session.inspect
    session["page_source"] = params[:id]
    
    redirect_to next_page_adapted_pages_url
  end
end
