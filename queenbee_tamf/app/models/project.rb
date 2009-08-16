class Project < ActiveRecord::Base
  belongs_to :company
  has_many :timesheets
  
  validates_presence_of :company, :message => "needs company"
  
  named_scope :active, :conditions => { :deleted => false }
  named_scope :deleted, :conditions => {:deleted => true }
  
end
