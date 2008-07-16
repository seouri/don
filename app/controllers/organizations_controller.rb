class OrganizationsController < ApplicationController
  # GET /organizations
  # GET /organizations.xml
  def index
    @organizations = Organization.search(params[:q], :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.xml
  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organization }
    end
  end

end
