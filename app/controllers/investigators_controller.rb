class InvestigatorsController < ApplicationController
  # GET /investigators
  # GET /investigators.xml
  def index
    @investigators = Investigator.paginate(:page => params[:page], :per_page => 15)

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
