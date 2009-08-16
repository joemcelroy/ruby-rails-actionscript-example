class AddDecimalHoursFromTimesheets < ActiveRecord::Migration
  def self.up
    add_column :timesheets, :hours, :decimal
  end

  def self.down
    remove_column :timesheets, :hours
  end
end
