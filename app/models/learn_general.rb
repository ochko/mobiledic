class LearnGeneral < ActiveRecord::Base
  QUIZ_NUMBER = 7
  
  def self.todays_quizzes_for(user)
    quizzes = find(:all, :limit=>QUIZ_NUMBER, 
                   :conditions =>["user_id =? and planned_at < ?", 
                                  user.id, Date.today]).
      collect{ |g| { g.word_id => g.quiz_type_id } }
    missing = QUIZ_NUMBER - quizzes.size;
    quizzes << Quiz.word_quiz_types_for(user, missing) if missing
    quizzes.flatten
  end
  
  def self.urgent_quizzes_for(user)
    quizzes = find(:all, :limit=>QUIZ_NUMBER, 
                   :conditions =>["user_id =?", 
                                  user.id]).
      collect{ |g| { g.word_id => g.quiz_type_id } }
    quizzes.flatten
  end
    
end
