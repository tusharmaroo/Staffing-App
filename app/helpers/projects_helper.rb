module ProjectsHelper
	def currentlyAssignedTeamMembers project_id
		@all = Assignment.where(:project_id => project_id)
		@teamMembers = []
		@all.each do |single|
			@teamMembers.push(Person.find(single.person_id))
		end
		@teamMembers
	end

	def getProject project_id
		Project.find(project_id)
	end

	def getGroupProjects id
		Project.where(:group_id => id)		
	end
end
