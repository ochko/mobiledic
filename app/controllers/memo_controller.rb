class MemoController < ApplicationController
  before_filter :login_required
  def index
    if current_user.quizzes_completed?
      LearnProcess.build_from(current_user)
      current_user.reset_quizzes!
      quizzes = LearnGeneral.todays_quizzes_for(current_user)
      quizzes = LearnGeneral.urgent_quizzes_for(current_user) if quizzes.empty?
      quizzes_det = Quiz.fetch_quiz(quizzes)
      LearnDetail.build_for_user(current_user, quizzes_det)
    end
    @learn_detail = current_user.learn_details.detect{ |d| !d.answered?}
    @quiz = @learn_detail.quiz if @learn_detail
  end

  def show
    @word = Word.find(params[:id])
  end
end
