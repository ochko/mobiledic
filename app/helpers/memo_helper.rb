module MemoHelper
  TYPE_ID_OF_MN = 1
  
  def memo_options(quiz)
    options = quiz.random_options << none_of_above(quiz)
    options.inject(''){ |tag, o| tag << 
      content_tag(:span, radio_button_tag('answer',o) << 
                  o, :class=>'choose' ) }
  end
  
  def none_of_above(quiz)
    quiz.quiz_type_id == TYPE_ID_OF_MN ? "аль нь ч биш" : "none of above"
  end
  
  def page_number(inc=1)
    details = current_user.learn_details
    completed = details.select{ |d| d.answered?}.count
    content_tag(:div, "#{completed+inc}/#{details.length}", 
                :class=>"counter")
  end
end
