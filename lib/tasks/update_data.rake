namespace :update_data do
  desc "TODO"
  task projects: :environment do
  	projects = Project.all
  	projects.each do |project|
  		if(project.endDate < Time.now)
  			project.active = false
  			project.save
  			assignments = Assignment.where(:project_id => project.id)
  			assignments.each do |assignment|
  				assignment.active = false
  				assignment.save
  			end
  		end
  	end
  end

end
