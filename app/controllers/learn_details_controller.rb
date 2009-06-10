class LearnDetailsController < ApplicationController
  before_filter :login_required
  require_role "admin", :except => :update
  def update
    learn_detail = LearnDetail.find(params[:id])
    learn_detail.update_attribute(:answer, params[:answer])
    if learn_detail.correct?
      flash[:notice] = 'Хариулт зөв байлаа.'
      redirect_to :controller => :memo, :action => :index
    else
      flash[:notice] = 'Хариулт буруу байлаа. Зөв хариулт нь:'
      redirect_to :controller => :memo, :action => :show, :id => learn_detail.word_id
    end
    
  end
  
  def index
    @learn_details = LearnDetail.all
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @learn_details }
      format.csv { send_csv }
    end
    
  end
  
  protected
  def send_csv
    csv_string = FasterCSV.generate do |csv|
      csv << [:user_id, :word_id, :quiz_type_id, :quiz_id, :answer, :answered_at]
      @learn_details.each do |d|
        csv << [d.user_id, d.word_id, d.quiz_type_id, d.quiz_id, d.answer, d.created_at]
      end
    end
    send_data csv_string, :filename => 'details.csv',
    :type => 'text/csv',
    :disposition => 'attachment'
  end

end
