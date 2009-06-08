class Quiz < ActiveRecord::Base
  PER_QUIZ = 3;
  belongs_to :word
  belongs_to :quiz_type
  
  def self.uniq_word_quiz_types
    find(:all, :select => 'word_id, quiz_type_id').
      collect{ |q| { q.word_id => q.quiz_type_id } }.
      uniq
  end
  
  def self.word_quiz_types_for(user, number)
    quiz_pool = uniq_word_quiz_types - user.learning_quizzes
    randoms = []
    number.times { randoms << quiz_pool.delete_at(rand(quiz_pool.length)) unless quiz_pool.empty? }
    randoms
  end
  
  def self.fetch_quiz(h)
    if h.instance_of?(Array)
      h.collect { |hh| find_by_word_and_type(hh) }.flatten
    else
      find_by_word_and_type(h)
    end
  end
  
  protected
  def self.find_by_word_and_type(h)
    word_id, type_id = 0, 0
    h.each_pair{ |k, v| word_id = k; type_id = v}
    find(:all, :limit => PER_QUIZ,
         :conditions => ["word_id=? and quiz_type_id=?", 
                         word_id, type_id])
  end
end
