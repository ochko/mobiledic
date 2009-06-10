class WordsController < ApplicationController
  require_role "admin"
  # GET /words
  # GET /words.xml
  def index
    @words = Word.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @words }
      format.csv { send_csv }
    end
  end

  # GET /words/1
  # GET /words/1.xml
  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @word }
    end
  end

  # GET /words/new
  # GET /words/new.xml
  def new
    @word = Word.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @word }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  # POST /words.xml
  def create
    @word = Word.new(params[:word])

    respond_to do |format|
      if @word.save
        flash[:notice] = 'Word was successfully created.'
        format.html { redirect_to(@word) }
        format.xml  { render :xml => @word, :status => :created, :location => @word }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /words/1
  # PUT /words/1.xml
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        flash[:notice] = 'Word was successfully updated.'
        format.html { redirect_to(@word) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.xml
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to(words_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def send_csv
    csv_string = FasterCSV.generate do |csv|
      csv << [:id, :word, :clause, :pronunciation, :english_definition, :mongolian_definition,:english_sentence, :mongolian_sentence,]
      @words.each do |w|
        csv << [w.id, w.word, w.clause, w.pronunciation, w.english_definition, w.mongolian_definition,w.english_sentence, w.mongolian_sentence,]
      end
    end
    send_data csv_string, :filename => 'words.csv',
    :type => 'text/csv',
    :disposition => 'attachment'
  end
end
