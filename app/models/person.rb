class Person < ActiveRecord::Base
  	belongs_to :group
  	
  	validates :name, :presence => true, :length => { :minimum => 2 }
	validates :skills, :presence => true, :length => { :minimum => 8 }
	validates :totalExp, :tcsExp, :relExp, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
	validates :mobilenumber, :presence => true
	validates_format_of :mobilenumber, :with => /\A\d{10}\Z/
	validates :allocation, :active, :group_id, :location, :emailid, :presence => true
	validates_format_of :emailid, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates :interestAreas, :presence => true, :length => { :minimum => 8 }

	def deactive
	  self.update_column :active, false
	  self.save
	end
end
