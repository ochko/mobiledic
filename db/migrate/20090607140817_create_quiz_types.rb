class CreateQuizTypes < ActiveRecord::Migration
  def self.up
    create_table :quiz_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :quiz_types
  end
end
