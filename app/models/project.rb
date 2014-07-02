class Project < ActiveRecord::Base
  	belongs_to :group

	validates :name, :presence => true, :length => { :minimum => 2 }, :on => :create
    validates :startDate, :presence => true, :on => :create
    validates :endDate, :presence => true, :on => :create
    validates :group_id, :presence => true, :on => :create
    validates :active, :presence => true, :on => :create
end
