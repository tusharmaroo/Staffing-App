class AddPersonalLearningsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :PersonalLearnings, :text
  end
end
