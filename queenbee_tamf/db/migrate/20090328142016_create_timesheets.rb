class CreateTimesheets < ActiveRecord::Migration
  def self.up
    create_table :timesheets do |t|
      t.text :description
      t.float :hours
      t.date :day
      t.integer :user_id
      t.integer :project_id
      t.string :billable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :timesheets
  end
end
