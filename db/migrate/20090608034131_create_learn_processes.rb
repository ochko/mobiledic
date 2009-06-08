class CreateLearnProcesses < ActiveRecord::Migration
  def self.up
    create_table :learn_processes do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :quiz_type_id
      t.float :eazyness_factor, :default => 2.5
      t.datetime :reviewed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :learn_processes
  end
end
