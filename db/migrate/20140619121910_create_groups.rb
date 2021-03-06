class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
