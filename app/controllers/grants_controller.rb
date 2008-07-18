class GrantsController < ApplicationController
  # GET /grants
  # GET /grants.xml
  def index
    @grants = Grant.paginate(:page => params[:page], :per_page => 10, :order => "grants.year desc, grants.award desc", :include => [:investigator, :organization, :activity])

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

end
