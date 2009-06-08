class LearnProcess < ActiveRecord::Base
  def self.build_from(user)
    ids = LearnDetail.ids_for(user)
    ids.each do |keys|
      correctness_string = LearnDetail.
        find_by_foreign_keys(keys).
        inject(''){ |str, d| str << d.correctness_symbol }
      process = new(keys)
      general = process.corresponding_general
      repetition, interval, factor = general ? [general.repetition, general.interval, general.eazyness_factor ] : [0, 1, 2.5]
      q = str2q(correctness_string)
      if q >=3
        if repetition == 0
          interval = 1
          repetition = 1
        elsif repetition == 1
          interval = 6
          repetition = 2
        else
          interval = (interval*factor).to_i
          repetition += 1
        end
      else
        repetition = 0
        interval = 1
      end
      factor = factor+(0.1-(5-q)*(0.08+(5-q)*0.02))
      factor = 1.3 if factor < 1.3
      process.reviewed_at = Time.now
      process.eazyness_factor = factor
      process.interval = interval
      process.save!
      general = LearnGeneral.new(keys) unless general
      general.reviewed_at = Time.now
      general.eazyness_factor = factor
      general.interval = interval
      general.planned_at = general.reviewed_at + interval.days
      general.repetition = repetition
      general.save!

    end
  end
  
  def corresponding_general
    LearnGeneral.find(:first, 
                      :conditions=> ["user_id=? and word_id=? and quiz_type_id=?",
                                     user_id, word_id, quiz_type_id])
  end
  
  def self.str2q(correctness_string)
    case correctness_string
      when 'ccc'
       5
      when 'fcc'
       4
      when 'ccf'
       4
      when 'cfc'
       3
      when 'ffc'
       2
      when 'fcf'
       1
      when 'cff'
       1
      when 'fff'
       0
    end
  end
end
