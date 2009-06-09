class LearnDetail < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :word
  belongs_to :user
  belongs_to :quiz_type
  
  def self.build_for_user(user, quizzes)
    mod = quizzes.length/3
    indxs = (1..mod).map {|i| i*3-2} << (1..mod).map {|i| i*3-1} << (1..mod).map {|i| i*3}
    mixed = []
    indxs.flatten.each { |i| mixed << quizzes[i] }
    mixed << (quizzes - mixed)
    mixed.flatten.compact.each { |q| create!(:user_id => user.id, :word_id => q.word_id,
                             :quiz_type_id => q.quiz_type_id, 
                             :quiz_id => q.id, :answer => '') }
  end
  
  def answered?
    !answer.blank?
  end
   
  def self.ids_for(user)
    user.learn_details.collect{ |d| {:user_id=>d.user_id, 
        :word_id=>d.word_id, 
        :quiz_type_id => d.quiz_type_id } }.
      uniq
  end
  
  def self.find_by_foreign_keys(keys)
    find(:all, 
          :conditions=>["user_id=? and word_id=? and quiz_type_id=?",
                        keys[:user_id], keys[:word_id], keys[:quiz_type_id] ],
          :order=> 'created_at')
  end
  
  def correct?
    quiz.correct == answer
  end
  
  def correctness_symbol
    correct? ? 'c' : 'f'
  end
end
