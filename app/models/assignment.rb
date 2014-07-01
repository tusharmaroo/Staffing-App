class Assignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :project
  belongs_to :person


  	validates :billable, :presence => true
    validates :group_id, :presence => true
    validates :project_id, :presence => true
    validates :person_id, :presence => true
    validates :allocation, :presence => true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :startdate, :presence => true
    validates :enddate, :presence => true
    validates :active, :presence => true
end
