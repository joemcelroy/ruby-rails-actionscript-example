class RemoveHoursFromTimesheets < ActiveRecord::Migration
  def self.up
    remove_column :timesheets, :hours
  end

  def self.down
    add_column :timesheets, :hours, :float
  end
end
