module MemoHelper
  TYPE_ID_OF_MN = 1
  
  def memo_options(quiz)
    options = quiz.random_options << none_of_above(quiz)
    options.inject(''){ |tag, o| tag << 
      content_tag(:span, radio_button_tag('answer',o.strip) << 
                  o.strip, :class=>'choose' ) }
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
  
  def todays_result
    content = '<div id="title">Үр дүн</div><table id="result"><tr><th>Word</th><th>Quiz Type</th><th>Үнэлгээ</th><th>Давтах</th></tr>'
    for r in LearnGeneral.today_learned_words(current_user)
      content << "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>" %
        [r.word.word, r.quiz_type.name, r.q,
         pluralize(r.interval, 'day')]
    end
    content << '</table><div id="legend">0-Муу, 5-Сайн</div>'
  end

end
