class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :skills
      t.float :totalExp
      t.float :tcsExp
      t.float :relExp
      t.string :mobilenumber
      t.string :emailid
      t.integer :allocation
      t.text :interestAreas
      t.boolean :active
      t.references :group, index: true

      t.timestamps
    end
  end
end
