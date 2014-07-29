class Group < ActiveRecord::Base
	has_many :people
	has_many :projects
	has_many :assignments

	validates :name, :presence => true, :length => { :minimum => 2 }
    validates :active, :presence => true

    def deactive
	  self.update_column :active, false
	end
	
end
