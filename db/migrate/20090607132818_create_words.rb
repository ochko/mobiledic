class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.string :word
      t.string :clause
      t.string :pronunciation
      t.string :english_definition
      t.string :mongolian_definition
      t.text :english_sentence
      t.text :mongolian_sentence

      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end
end
