class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :startDate
      t.datetime :endDate
      t.references :group, index: true

      t.timestamps
    end
  end
end
