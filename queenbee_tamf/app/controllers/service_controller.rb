class ServiceController < ApplicationController
  wsdl_service_name 'Service'
  web_service_scaffold :invoke
  
  def export_timesheets(username, password, exportRequest)
    @timesheets = Timesheet.find(:all, :conditions => [:from => exportRequest['from'], 
                                                       :to => exportRequest['to'],
                                                       :company_id => exportRequest['company_id'],
                                                       :user_id => exportRequest['user_id']])
                                                       
    @timesheets.map {|timesheet| TimesheetReport.from_active_record(timesheet) }  
                                                    
  end
  
  def company_list(username, password)
    Company.active.map {|company| CompanyReport.from_active_record(company) }
  end
  
  def project_list(username, password)
    Project.active.map {|project| ProjectReport.from_active_record(project) }
  end
  
  def user_list(username, password)
    User.all.map {|user| UserReport.from_active_record(user) }
  end

  
  [:export_timesheets, :company_list, :project_list, :user_list].each do |method_name|
     class_eval <<-EOM
        def #{method_name}_with_authentication(*params)
          authenticate!(params[0], params[1])
          #{method_name}_without_authentication(*params)
        end
      EOM

      alias_method_chain method_name, :authentication
  end

  private
  def authenticate!(username, password)
    authenticated = !User.authenticate(username,password).blank? 
    raise "Could not authenticate this user, please check your credentials" unless authenticated
  end
  
end
