class InvestigatorsController < ApplicationController
  before_filter :find_organization

  # GET /investigators
  # GET /investigators.xml
  def index
    @investigators = (@organization ? @organization.investigators : Investigator).search(params[:q], :page => params[:page], :total_entries => @total_entries)

    respond_to do |format|
      format.html {
        if @investigators.size == 0
          @organizations = Organization.search(params[:q], :page => params[:page])
          if @organizations.size > 0
            redirect_to organizations_path(params)
          end
        elsif @investigators.size == 1
          redirect_to investigator_path(@investigators[0])
        end
      } # index.html.erb
      format.xml  { render :xml => @investigators }
    end
  end

  # GET /investigators/1
  # GET /investigators/1.xml
  def show
    @investigator = Investigator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @investigator }
    end
  end

protected
  def find_organization
    if params[:organization_id]
      @organization = Organization.find(params[:organization_id])
      @total_entries = @organization.investigators_count
    end
  end
end
