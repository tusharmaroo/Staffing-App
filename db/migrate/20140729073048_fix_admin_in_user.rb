class FixAdminInUser < ActiveRecord::Migration
  def change
  	rename_column :users, :Admin, :admin
  end
end
