class Group < ActiveRecord::Base
	has_many :people, :dependent => :destroy
	has_many :projects, :dependent => :destroy
	has_many :assignments, :dependent => :destroy
end
