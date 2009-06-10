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
    content = '<table id="result"><tr><th>Word</th><th>Quiz Type</th><th>Үнэлгээ</th><th>Давтах</th></tr>'
    for r in LearnGeneral.today_learned_words(current_user)
      content << "<tr><td>%s</td><td>%s</td><td>%s (%s)</td><td>%s</td></tr>" %
        [r.word.word, r.quiz_type.name, r.eazyness_factor,
         factor_in_words(r.eazyness_factor), 
         pluralize(r.interval, 'day')]
    end
    content << '</table>'
  end
  
  def factor_in_words(factor)
    return 'Муу' if factor <= 1.3
    return 'Сайн' if factor > 2.5
    return 'Дундаж'
  end
end
