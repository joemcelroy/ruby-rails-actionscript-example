class TimesheetsController < ApplicationController
  # GET /timesheets
  # GET /timesheets.xml
  def index
    @timesheets = current_user.timesheets.find(:all, :include => [:project])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @timesheets }
      format.amf  {render :amf => @timesheets }
    end
  end

  # GET /timesheets/1
  # GET /timesheets/1.xml
  def show
    @timesheet = Timesheet.find(is_amf ? params[0] : params[:id] )     

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @timesheet }
      format.amf  {render :amf => @timesheet }
    end
  end

  # GET /timesheets/new
  # GET /timesheets/new.xml
  def new
    @timesheet = Timesheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @timesheet }
    end
  end

  # GET /timesheets/1/edit
  def edit
    @timesheet = Timesheet.find(params[:id])
  end

  # POST /timesheets
  # POST /timesheets.xml
  def create
    #@timesheet = Timesheet.new(params[:timesheet])
    
    if is_amf
      @timesheet = params[0]
      @timesheet.user_id = current_user.id
    else
      @timesheet = current_user.timesheets.build(params[:timesheet])
    end 

    respond_to do |format|
      if @timesheet.save
        flash[:notice] = 'Timesheet was successfully created.'
        format.html { redirect_to(@timesheet) }
        format.xml  { render :xml => @timesheet, :status => :created, :location => @timesheet }
        format.amf  {render :amf => @timesheet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @timesheet.errors, :status => :unprocessable_entity }
        format.amf  { render :amf => @timesheet.errors } 
      end
    end
  end

  # PUT /timesheets/1
  # PUT /timesheets/1.xml
  def update
    @timesheet = Timesheet.find(is_amf ? params[0] : params[:id] )
    
    if is_amf
      @timesheet.description = params[0].description
      @timesheet.hours = params[0].hours
      @timesheet.project_id = params[0].project_id
    else
      @timesheet.attributes = params[:timesheet]
    end

    respond_to do |format|
      if @timesheet.save!
        flash[:notice] = 'Timesheet was successfully updated.'
        format.html { redirect_to(@timesheet) }
        format.xml  { head :ok }
        format.amf  {render :amf => @timesheet }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @timesheet.errors, :status => :unprocessable_entity }
        format.amf  {render :amf => @timesheet.errors }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.xml
  def destroy
    @timesheet = Timesheet.find(is_amf ? params[0] : params[:id])
    @timesheet.destroy

    respond_to do |format|
      format.html { redirect_to(timesheets_url) }
      format.xml  { head :ok }
      format.amf  { render :amf => "ok" }
    end
  end
end
