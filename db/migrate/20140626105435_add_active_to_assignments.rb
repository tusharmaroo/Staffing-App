class AddActiveToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :active, :boolean, :default => true
  end
end
