class LearnGeneral < ActiveRecord::Base
  QUIZ_NUMBER = 7
  belongs_to :word
  belongs_to :quiz_type
  
  
  def self.todays_quizzes_for(user)
    quizzes = find(:all, :limit=>QUIZ_NUMBER, 
                   :conditions =>["user_id =? and planned_at < ?", 
                                  user.id, Date.today]).
      collect{ |g| { g.word_id => g.quiz_type_id } }
    missing = QUIZ_NUMBER - quizzes.size;
    quizzes << Quiz.word_quiz_types_for(user, missing) if missing
    still_missing = QUIZ_NUMBER - quizzes.flatten.size;
    quizzes << urgent_quizzes_for(user, still_missing) if still_missing
    quizzes.flatten
  end
  
  def self.urgent_quizzes_for(user, number=QUIZ_NUMBER)
    quizzes = find(:all, :limit=>number,
                   :conditions =>["user_id =?", 
                                  user.id]).
      collect{ |g| { g.word_id => g.quiz_type_id } }
    quizzes.flatten
  end
  
  def self.today_learned_words(user)
    find(:all, :order=> 'reviewed_at desc', 
         :limit => QUIZ_NUMBER,
         :conditions=>['user_id=?',user.id])
  end
  
    
end
