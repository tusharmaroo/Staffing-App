class Person < ActiveRecord::Base
  	belongs_to :group
  	
  	validates :name, :presence => true, :length => { :minimum => 2 }
	validates :skills, :presence => true, :length => { :minimum => 8 }
	validates :totalExp, :presence => true, :on => :create
	validates :tcsExp, :presence => true, :on => :create
	validates :relExp, :presence => true, :on => :create
	validates :mobilenumber, :presence => true, :on => :create
	validates_format_of :mobilenumber, :with => /\A\d{10}\Z/, :on => :create
	validates :emailid, :presence => true, :on => :create
	validates_format_of :emailid, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates :allocation, :presence => true, :on => :save
	validates :interestAreas, :presence => true, :length => { :minimum => 8 }, :on => :create
	validates :active, :presence => true, :on => :create
	validates :group_id, :presence => true, :on => :create
	validates :location, :presence => true, :on => :create
end
