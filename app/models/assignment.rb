class Assignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :project
  belongs_to :person


  validates :group_id, :project_id, :person_id, :startdate, :enddate, :active, :presence => true
  validates :allocation, :presence => true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def deactive
    person = Person.find(self.person_id)
    newAllocation = person.allocation
    newAllocation -= self.allocation
    person.update_column :allocation, newAllocation
    self.update_column :enddate, Time.now
    self.update_column :active, false
  end
  
end
