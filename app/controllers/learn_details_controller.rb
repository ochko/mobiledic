class LearnDetailsController < ApplicationController
  before_filter :login_required
  def update
    learn_detail = LearnDetail.find(params[:id])
    learn_detail.update_attribute(:answer, params[:answer])
    if learn_detail.correct?
      redirect_to :controller => :memo, :action => :index
    else
      redirect_to :controller => :memo, :action => :show, :id => learn_detail.word_id
    end
    
  end

end
