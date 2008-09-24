class GrantsController < ApplicationController
  before_filter :find_organization

  # GET /grants
  # GET /grants.xml
  def index
    @grants = (@organization ? @organization.grants : Grant).paginate(:page => params[:page], :per_page => 10, :order => "grants.year desc, grants.award desc", :include => [:investigator, :organization, :activity], :total_entries => @total_entries)

    respond_to do |format|
      format.html {
        if params.key?(:q)
          redirect_to investigators_path(params)
        end
      }# index.html.erb
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
  
protected
  def find_organization
    @total_entries = Grant.last.id unless Grant.last.nil?
    if params[:organization_id]
      @organization = Organization.find(params[:organization_id])
      @total_entries = @organization.grants_count
    end
  end
end
