class Group < ActiveRecord::Base
	has_many :people
	has_many :projects
	has_many :assignments

	validates :name, :presence => true, :length => { :minimum => 2 }, :on => :create
    validates :active, :presence => true, :on => :create
end
