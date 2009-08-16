class Company < ActiveRecord::Base
  has_many :projects
  
  named_scope :active, :conditions => { :deleted => 0 }
  named_scope :deleted, :conditions => {:deleted => 1 }
  
  
end
