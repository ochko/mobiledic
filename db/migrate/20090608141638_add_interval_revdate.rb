class AddIntervalRevdate < ActiveRecord::Migration
  def self.up
    add_column :learn_processes, :interval, :integer
    add_column :learn_generals, :interval, :integer
    remove_column :learn_generals, :is_delayed
  end

  def self.down
    remove_column :learn_processes, :interval
    remove_column :learn_generals, :interval
    add_column :learn_generals, :is_delayed, :boolean
  end
end
