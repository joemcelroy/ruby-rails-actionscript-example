class ExportRequest < ActionWebService::Struct
    
 member :project_id, :string
 member :company_id, :string
 member :user_id, :string
 member :from, :date
 member :to, :date
  
end
