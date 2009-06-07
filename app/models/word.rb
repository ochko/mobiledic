class Word < ActiveRecord::Base
  has_many :quizzes
end
