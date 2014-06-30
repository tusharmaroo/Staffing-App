class Person < ActiveRecord::Base
  	belongs_to :group
  	validates :name, :presence => true, :length => { :minimum => 2 }
	validates :skills, :presence => true, :length => { :minimum => 2 }
	validates :totalExp, :presence => true
	validates :tcsExp, :presence => true
	validates :relExp, :presence => true
	validates :mobilenumber, :presence => true
	validates :emailid, :presence => true, :uniqueness => true, :on => :save
	validates :allocation, :presence => true
	validates :interestAreas, :presence => true
	validates :active, :presence => true
	validates :group_id, :presence => true
	validates :created_at, :presence => true
	validates :updated_at, :presence => true
	validates :location, :presence => true
end
