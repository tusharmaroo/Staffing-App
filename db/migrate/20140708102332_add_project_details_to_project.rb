class AddProjectDetailsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :ProjectDetails, :text
  end
end
