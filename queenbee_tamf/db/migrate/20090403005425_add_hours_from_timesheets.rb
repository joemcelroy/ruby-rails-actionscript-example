class AddHoursFromTimesheets < ActiveRecord::Migration
  def self.up
    add_column :timesheets, :hours, :double
  end

  def self.down
    remove_column :timesheets, :hours
  end
end
