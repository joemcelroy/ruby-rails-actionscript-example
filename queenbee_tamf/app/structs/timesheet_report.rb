class TimesheetReport < ActionWebService::Struct
    
 member :id, :integer
 member :description, :text
 member :billable_type, :string
 member :hours, :string
 member :day, :date
 member :user, UserReport
 member :project, ProjectReport
 
 def self.from_active_record(timesheet)
    self.new(
      :id => timesheet.id,
      :description => timesheet.description,
      :billable_type => timesheet.billable_type.to_s,
      :day => timesheet.day,
      :hours => timesheet.hours.to_s,
      :user => timesheet.user.to_struct,
      :project => timesheet.project.to_struct
    )
 end
  
end
