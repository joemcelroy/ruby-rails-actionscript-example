class RemoveDoubleHoursFromTimesheets < ActiveRecord::Migration
  def self.up
    remove_column :timesheets, :hours
  end

  def self.down
    add_column :timesheets, :hours, :double
  end
end
