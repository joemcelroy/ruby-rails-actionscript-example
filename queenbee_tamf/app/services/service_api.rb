class ServiceApi < ActionWebService::API::Base
  
  api_method :export_timesheets,
    :expects => [
      {:username => :string},
      {:password => :string},
      {:search => ExportRequest}
    ],
   :returns => [[TimesheetReport]]

   api_method :company_list, 
    :expects => [
      {:username => :string},
      {:password => :string}
    ],
   :returns => [[CompanyReport]]

   api_method :project_list, 
    :expects => [
      {:username => :string},
      {:password => :string}
    ],
   :returns => [[ProjectReport]]
   
   api_method :user_list, 
    :expects => [
      {:username => :string},
      {:password => :string}
    ],
   :returns => [[UserReport]]
   
end
