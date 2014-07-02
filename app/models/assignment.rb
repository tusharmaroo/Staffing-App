class Assignment < ActiveRecord::Base
  belongs_to :group
  belongs_to :project
  belongs_to :person


	validates :billable, :presence => true, :on => :create
  validates :group_id, :presence => true, :on => :create
  validates :project_id, :presence => true, :on => :create
  validates :person_id, :presence => true, :on => :create
  validates :allocation, :presence => true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, :on => :create
  validates :startdate, :presence => true, :on => :create
  validates :enddate, :presence => true, :on => :create
  validates :active, :presence => true, :on => :create
end
