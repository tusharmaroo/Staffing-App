class Group < ActiveRecord::Base
	has_many :people
	has_many :projects
	has_many :assignments
end
