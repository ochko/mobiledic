class LearnGeneralsController < ApplicationController
  require_role "admin"
  # GET /learn_generals
  # GET /learn_generals.xml
  def index
    @learn_generals = LearnGeneral.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @learn_generals }
    end
  end

  # GET /learn_generals/1
  # GET /learn_generals/1.xml
  def show
    @learn_general = LearnGeneral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learn_general }
    end
  end

  # GET /learn_generals/new
  # GET /learn_generals/new.xml
  def new
    @learn_general = LearnGeneral.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @learn_general }
    end
  end

  # GET /learn_generals/1/edit
  def edit
    @learn_general = LearnGeneral.find(params[:id])
  end

  # POST /learn_generals
  # POST /learn_generals.xml
  def create
    @learn_general = LearnGeneral.new(params[:learn_general])

    respond_to do |format|
      if @learn_general.save
        flash[:notice] = 'LearnGeneral was successfully created.'
        format.html { redirect_to(@learn_general) }
        format.xml  { render :xml => @learn_general, :status => :created, :location => @learn_general }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @learn_general.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /learn_generals/1
  # PUT /learn_generals/1.xml
  def update
    @learn_general = LearnGeneral.find(params[:id])

    respond_to do |format|
      if @learn_general.update_attributes(params[:learn_general])
        flash[:notice] = 'LearnGeneral was successfully updated.'
        format.html { redirect_to(@learn_general) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @learn_general.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /learn_generals/1
  # DELETE /learn_generals/1.xml
  def destroy
    @learn_general = LearnGeneral.find(params[:id])
    @learn_general.destroy

    respond_to do |format|
      format.html { redirect_to(learn_generals_url) }
      format.xml  { head :ok }
    end
  end
end
