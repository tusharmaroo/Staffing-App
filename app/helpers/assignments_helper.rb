module AssignmentsHelper
	def getProjectStatus(person_id)
		@assignments = Assignment.where(:person_id => person_id,:active => true)
		@status = false
		@t = @assignments.order(:enddate).first
		Rails.logger.info "-------------------------------#{@t}"
		#@assignments.each do |assignment|
			#@status = @status || Project.find(assignment.project_id).active
		#end
		#if @status
		#@firstAssignment.id
		if (@t.class == Assignment ) && ((@t.enddate - Time.now) < 7.days)
			"Success"
		else
			"Active"		
		end
	end
end
