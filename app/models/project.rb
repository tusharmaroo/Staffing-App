class Project < ActiveRecord::Base
  	belongs_to :group

	validates :name, :presence => true, :length => { :minimum => 2 }
    validates :startDate, :endDate, :active, :presence => true
    validates :active, :group_id, :presence => true, :on => :create

    def deactive
      self.update_column :active, false
      self.save
    end

    def AllocatedPeople
    	allocatedAssignments = Assignment.where(:project_id => self.id)
    	array = []
    	allocatedAssignments.each do |allocatedAssignment|
    		array << allocatedAssignment.person_id
    	end
    	array.uniq
    	array
    end
end
