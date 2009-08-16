class Timesheet < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  validates_presence_of :user, :project
  
  named_scope :focus_month_timesheets, lambda { |year, month| 
                date = Time.gm year, month
                from = date.last_month.end_of_month
                to =  date.next_month.beginning_of_month
                    { :conditions => { :day => from .. to } } }
                    
  named_scope :focus_day_timesheets, lambda { |year, month, day|
                date = "#{year}-#{month}-#{day}"
                {:conditions => { :day => date }}
    }
  
    def project_name 
      return project.name
    end 
    
end
