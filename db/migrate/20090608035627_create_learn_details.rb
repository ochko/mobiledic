class CreateLearnDetails < ActiveRecord::Migration
  def self.up
    create_table :learn_details do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :quiz_type_id
      t.integer :quiz_id
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :learn_details
  end
end
