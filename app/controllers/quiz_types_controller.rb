class QuizTypesController < ApplicationController
  # GET /quiz_types
  # GET /quiz_types.xml
  def index
    @quiz_types = QuizType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quiz_types }
    end
  end

  # GET /quiz_types/1
  # GET /quiz_types/1.xml
  def show
    @quiz_type = QuizType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quiz_type }
    end
  end

  # GET /quiz_types/new
  # GET /quiz_types/new.xml
  def new
    @quiz_type = QuizType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quiz_type }
    end
  end

  # GET /quiz_types/1/edit
  def edit
    @quiz_type = QuizType.find(params[:id])
  end

  # POST /quiz_types
  # POST /quiz_types.xml
  def create
    @quiz_type = QuizType.new(params[:quiz_type])

    respond_to do |format|
      if @quiz_type.save
        flash[:notice] = 'QuizType was successfully created.'
        format.html { redirect_to(@quiz_type) }
        format.xml  { render :xml => @quiz_type, :status => :created, :location => @quiz_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quiz_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quiz_types/1
  # PUT /quiz_types/1.xml
  def update
    @quiz_type = QuizType.find(params[:id])

    respond_to do |format|
      if @quiz_type.update_attributes(params[:quiz_type])
        flash[:notice] = 'QuizType was successfully updated.'
        format.html { redirect_to(@quiz_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quiz_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_types/1
  # DELETE /quiz_types/1.xml
  def destroy
    @quiz_type = QuizType.find(params[:id])
    @quiz_type.destroy

    respond_to do |format|
      format.html { redirect_to(quiz_types_url) }
      format.xml  { head :ok }
    end
  end
end
