class Person < ActiveRecord::Base
  	belongs_to :group
  	validates :name, :presence => true, :length => { :minimum => 2 }
	validates :skills, :presence => true, :length => { :minimum => 8 }
	validates :totalExp, :presence => true
	validates :tcsExp, :presence => true
	validates :relExp, :presence => true
	validates :mobilenumber, :presence => true
	validates_format_of :mobilenumber, :with => /\A\d{10}\Z/, :on => :save
	validates :emailid, :presence => true, :uniqueness => true
	validates_format_of :emailid, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :save
	validates :allocation, :presence => true
	validates :interestAreas, :presence => true, :length => { :minimum => 8 }
	validates :active, :presence => true
	validates :group_id, :presence => true
	validates :location, :presence => true
end
