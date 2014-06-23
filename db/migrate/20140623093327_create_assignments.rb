class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.boolean :billable
      t.references :group, index: true
      t.references :project, index: true
      t.references :person, index: true
      t.integer :allocation

      t.timestamps
    end
  end
end
