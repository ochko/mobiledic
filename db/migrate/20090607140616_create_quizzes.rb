class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.integer :word_id
      t.integer :quiz_type_id
      t.text :question
      t.text :options
      t.string :correct

      t.timestamps
    end
  end

  def self.down
    drop_table :quizzes
  end
end
