require 'fastercsv'
class LearnProcessesController < ApplicationController
  require_role "admin"
  # GET /learn_processes
  # GET /learn_processes.xml
  def index
    @learn_processes = LearnProcess.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @learn_processes }
      format.csv { send_csv }
    end
  end

  # GET /learn_processes/1
  # GET /learn_processes/1.xml
  def show
    @learn_process = LearnProcess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learn_process }
    end
  end

  # GET /learn_processes/new
  # GET /learn_processes/new.xml
  def new
    @learn_process = LearnProcess.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @learn_process }
    end
  end

  # GET /learn_processes/1/edit
  def edit
    @learn_process = LearnProcess.find(params[:id])
  end

  # POST /learn_processes
  # POST /learn_processes.xml
  def create
    @learn_process = LearnProcess.new(params[:learn_process])

    respond_to do |format|
      if @learn_process.save
        flash[:notice] = 'LearnProcess was successfully created.'
        format.html { redirect_to(@learn_process) }
        format.xml  { render :xml => @learn_process, :status => :created, :location => @learn_process }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @learn_process.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /learn_processes/1
  # PUT /learn_processes/1.xml
  def update
    @learn_process = LearnProcess.find(params[:id])

    respond_to do |format|
      if @learn_process.update_attributes(params[:learn_process])
        flash[:notice] = 'LearnProcess was successfully updated.'
        format.html { redirect_to(@learn_process) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @learn_process.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /learn_processes/1
  # DELETE /learn_processes/1.xml
  def destroy
    @learn_process = LearnProcess.find(params[:id])
    @learn_process.destroy

    respond_to do |format|
      format.html { redirect_to(learn_processes_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def send_csv
    csv_string = FasterCSV.generate do |csv|
      csv << [:user_id, :word_id, :quiz_type_id, :eazyness_factor, :interval, :reviewed_at]
      @learn_processes.each do |p|
        csv << [p.user_id, p.word_id, p.quiz_type_id, p.eazyness_factor, p.interval, p.reviewed_at]
      end
    end
    send_data csv_string, :filename => 'processes.csv',
    :type => 'text/csv',
    :disposition => 'attachment'
  end
end
