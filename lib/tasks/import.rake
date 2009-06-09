namespace :db do
  desc "load words from csv"
  task :load_words  => :environment do
    require 'fastercsv'
    FasterCSV.foreach("db/words.csv",  { :col_sep => "|" }) do |row|
      Word.create(:id => row[0], :word =>row[1], :clause => row[2], :pronunciation =>row[3], 
                  :english_definition => row[4], :mongolian_definition => row[5], 
                  :english_sentence => row[6], :mongolian_sentence => row[7])
    end    
  end
  
  desc "load quizzes from csv"
  task :load_quizzes  => :environment do
    require 'fastercsv'
    FasterCSV.foreach("db/quizzes.csv",  { :col_sep => "|" }) do |row|
      Quiz.create(:word_id => row[0], :quiz_type_id=> row[1], :question=> row[2],
                  :options=> row[3], :correct=> row[4])
    end    
  end
  
  desc "load quiz types from csv"
  task :load_quiz_types  => :environment do
    require 'fastercsv'
    FasterCSV.foreach("db/types.csv",  { :col_sep => "|" }) do |row|
      QuizType.create(:name => row[0], :description=> row[1] )
    end    
  end
end
