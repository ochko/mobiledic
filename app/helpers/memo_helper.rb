module MemoHelper
  SEP = ';'
  TYPE_ID_OF_MN = 1
  
  def memo_options(quiz)
    options = quiz.options.split(SEP) << quiz.correct << none_of_above(quiz)
    options.inject(''){ |tag, o| tag << 
      content_tag(:span, radio_button_tag('answer',o) << 
                  o, :class=>'choose' ) }
  end
  
  def none_of_above(quiz)
    quiz.quiz_type_id == TYPE_ID_OF_MN ? "аль нь ч биш" : "none of above"
  end
end
