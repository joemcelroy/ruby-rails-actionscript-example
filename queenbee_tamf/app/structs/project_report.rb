class ProjectReport < ActionWebService::Struct
   
   member :id, Integer
   member :name, :string
   member :company_id, :string
   member :company, CompanyReport
   
   def self.from_active_record(project)
      self.new(
        :id => project.id,
        :name => project.name.to_s,
        :company_id => project.company.id.to_s,
        :company => project.company.to_struct
      )
   end
    
end
  
