class QuizzesController < ApplicationController
  require_role "admin"
  # GET /quizzes
  # GET /quizzes.xml
  def index
    @quizzes = Quiz.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quizzes }
      format.csv { send_csv }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.xml
  def show
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/new
  # GET /quizzes/new.xml
  def new
    @word = Word.find(params[:word_id])
    @quiz = @word.quizzes.build(params[:quiz])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quiz }
    end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.xml
  def create
    @quiz = Quiz.new(params[:quiz])

    respond_to do |format|
      if @quiz.save
        flash[:notice] = 'Quiz was successfully created.'
        format.html { redirect_to(@quiz) }
        format.xml  { render :xml => @quiz, :status => :created, :location => @quiz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quizzes/1
  # PUT /quizzes/1.xml
  def update
    @quiz = Quiz.find(params[:id])

    respond_to do |format|
      if @quiz.update_attributes(params[:quiz])
        flash[:notice] = 'Quiz was successfully updated.'
        format.html { redirect_to(@quiz) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quiz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.xml
  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy

    respond_to do |format|
      format.html { redirect_to(quizzes_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def send_csv
    csv_string = FasterCSV.generate do |csv|
      csv << [:word_id, :quiz_type_id, :question, :options, :correct]
      @quizzes.each do |q|
        csv << [q.word_id, q.quiz_type_id, q.question, q.options, q.correct]
      end
    end
    send_data csv_string, :filename => 'quizzes.csv',
    :type => 'text/csv',
    :disposition => 'attachment'
  end

end
