class AddDeletedToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :deleted, :boolean, :default => 0
  end

  def self.down
    remove_column :companies, :deleted
  end
end
