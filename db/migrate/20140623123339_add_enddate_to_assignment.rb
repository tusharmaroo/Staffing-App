class AddEnddateToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :enddate, :datetime
  end
end
