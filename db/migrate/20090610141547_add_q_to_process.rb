class AddQToProcess < ActiveRecord::Migration
  def self.up
    add_column :learn_processes, :q, :integer
    add_column :learn_generals, :q, :integer
  end

  def self.down
    remove_column :learn_processes, :q
    remove_column :learn_generals, :q
  end
end
