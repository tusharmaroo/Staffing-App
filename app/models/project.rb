class Project < ActiveRecord::Base
  	belongs_to :group

	validates :name, :presence => true, :length => { :minimum => 2 }
    validates :startDate, :presence => true
    validates :endDate, :presence => true
    validates :group_id, :presence => true
    validates :active, :presence => true
end
