class CreateLearnGenerals < ActiveRecord::Migration
  def self.up
    create_table :learn_generals do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :quiz_type_id
      t.integer :repetition, :default => 0
      t.float :eazyness_factor, :default => 2.5
      t.datetime :reviewed_at
      t.datetime :planned_at
      t.boolean :is_delayed

      t.timestamps
    end
  end

  def self.down
    drop_table :learn_generals
  end
end
