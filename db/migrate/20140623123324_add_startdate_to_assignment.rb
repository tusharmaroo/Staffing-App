class AddStartdateToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :startdate, :datetime
  end
end
