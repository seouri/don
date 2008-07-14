class GrantsController < ApplicationController
  # GET /grants
  # GET /grants.xml
  def index
    @grants = Grant.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @grants }
    end
  end

  # GET /grants/1
  # GET /grants/1.xml
  def show
    @grant = Grant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grant }
    end
  end

  # GET /grants/new
  # GET /grants/new.xml
  def new
    @grant = Grant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grant }
    end
  end

  # GET /grants/1/edit
  def edit
    @grant = Grant.find(params[:id])
  end

  # POST /grants
  # POST /grants.xml
  def create
    @grant = Grant.new(params[:grant])

    respond_to do |format|
      if @grant.save
        flash[:notice] = 'Grant was successfully created.'
        format.html { redirect_to(@grant) }
        format.xml  { render :xml => @grant, :status => :created, :location => @grant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /grants/1
  # PUT /grants/1.xml
  def update
    @grant = Grant.find(params[:id])

    respond_to do |format|
      if @grant.update_attributes(params[:grant])
        flash[:notice] = 'Grant was successfully updated.'
        format.html { redirect_to(@grant) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /grants/1
  # DELETE /grants/1.xml
  def destroy
    @grant = Grant.find(params[:id])
    @grant.destroy

    respond_to do |format|
      format.html { redirect_to(grants_url) }
      format.xml  { head :ok }
    end
  end
end
