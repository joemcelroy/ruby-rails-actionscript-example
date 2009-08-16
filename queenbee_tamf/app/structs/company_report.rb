class CompanyReport < ActionWebService::Struct
   
   member :id, Integer
   member :name, :string
   member :project, [ProjectReport]
   
   def self.from_active_record(company)
      self.new(
        :id => company.id,
        :name => company.name.to_s,
        :project => company.projects.map {|project| ProjectReport.from_active_record(project) }
      )
   end
    
end