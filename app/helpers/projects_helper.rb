module ProjectsHelper
	def currentlyAssignedTeamMembers project
		@all = Assignment.where(:project_id => '1')
		@teamMembers = []
		@all.each do |single|
			@teamMembers.push(Person.find(single.person_id))
		end
		@teamMembers
	end
end
