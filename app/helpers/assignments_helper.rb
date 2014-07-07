module AssignmentsHelper
	def getProjectStatus(person_id)
		@assignments = Assignment.where(:person_id => person_id,:active => true)
		@status = false
		@assignments.each do |assignment|
			@status = @status || Project.find(assignment.project_id).active
		end
		if @status
			"active"
		else
			"success"
		end
	end
end
