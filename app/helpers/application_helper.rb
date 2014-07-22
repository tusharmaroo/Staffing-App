module ApplicationHelper
	def nice_date_form(the_date)
      if !the_date.nil? 
         the_date.strftime("%d/%m/%y")
      end
   end

   def getAllLocations
   		["Mumbai","Banglore","Gurgaon","Kolkata","NYC"]
   end

   def getProjectStatus(person_id)
		@assignments = Assignment.where(:person_id => person_id,:active => true)
		@status = false
		@t = @assignments.order(:enddate).first

		#@assignments.each do |assignment|
			#@status = @status || Project.find(assignment.project_id).active
		#end
		#if @status
		#@firstAssignment.id
		@t.enddate
	end
end
