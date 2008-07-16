class InvestigatorsController < ApplicationController
  # GET /investigators
  # GET /investigators.xml
  def index
    @investigators = Investigator.search(params[:q], :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
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

end
