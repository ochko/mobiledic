class AddDescriptionToQuizType < ActiveRecord::Migration
  def self.up
    add_column :quiz_types, :description, :string
  end

  def self.down
    remove_column :quiz_types, :description
  end
end
