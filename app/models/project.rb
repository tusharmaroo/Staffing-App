class Project < ActiveRecord::Base
    acts_as_xlsx
  	belongs_to :group

	validates :name, :presence => true, :length => { :minimum => 2 }
    validates :startDate, :endDate, :active, :presence => true
    validates :active, :group_id, :presence => true, :on => :create

    def deactive
      self.update_column :endDate ,Time.now
      self.update_column :active, false
    end

    def AllocatedPeople
    	allocatedAssignments = Assignment.where(:project_id => self.id, :active => true)
    	array = []
    	allocatedAssignments.each do |allocatedAssignment|
    		array << allocatedAssignment.person_id
    	end
    	array.uniq
    	array
    end
end
