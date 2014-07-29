namespace :update_data do
  desc "TODO"
  task projects: :environment do
  	projects = Project.all
  	projects.each do |project|
  		if(project.endDate < Time.now)
  			project.active = false
  			project.save
  			assignments = Assignment.where(:project_id => project.id,:active => true)
  			assignments.each do |assignment|
          ##handle for users allocation if enddate is passed but still active.
  				assignment.active = false
  				assignment.save
  			end
  		end
  	end
  end

end
