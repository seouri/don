class OrganizationsController < ApplicationController
  # GET /organizations
  # GET /organizations.xml
  def index
    @organizations = Organization.search(params[:q], :page => params[:page])

    respond_to do |format|
      format.html  {
        if @organizations.size == 0
          @investigators = Investigator.search(params[:q], :page => params[:page])
          if @investigators.size > 0
            redirect_to investigators_path(params)
          end
        elsif params.key?(:q) and @organizations.size == 1
          redirect_to organization_path(@organizations[0])
        end
      } # index.html.erb
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
protected
  def total_entries
    @total_entries = Organization.last.id
  end
end
