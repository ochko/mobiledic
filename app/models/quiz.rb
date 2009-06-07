class Quiz < ActiveRecord::Base
  belongs_to :word
  belongs_to :quiz_type
end
