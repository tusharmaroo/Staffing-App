class GroupsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_group, only: [:show, :edit, :update, :destroy]
	def index
		@groups = Group.all 
	end

	def new_project

	end

	def projects
		@people = Person.all
		@group = Group.find(params[:group_id])
		@personnew = Person.new
		@project = Project.new
		@projects = Project.all
	end

	def people
		@people = Person.all
		@group = Group.find(params[:group_id])
		@personnew = Person.new
		@project = Project.new
		@projects = Project.all
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to groups_path
		else
			render new_group_path
		end
	end

	def new
		@group = Group.new
	end

	def show
		@people = Person.where(:group_id => @group.id)
		@assignments = Assignment.all 

		if !@group.active?
			redirect_to edit_group_path(@group), :notice => "You need to enable the group first!"
		end

	end

	def edit

	end

	def update
		if @group.update(group_params)
			redirect_to groups_path(@group)
		else
			redirect_to edit_group_path(@group)
		end
	end

	def enable
		@group.active = true
		if @group.save
			redirect_to groups_path
		else
			redirect_to groups_path
		end
	end

	def destroy
		@group.active = false
		@groupPeople = Person.where(:group_id => @group.id, :active => true)

		@groupProjects = Project.where(:group_id => @group.id, :active => true)
		if (!@groupProjects.empty?)
   			@groupProjects.each do |groupProject|
   				groupProject.active = false
   				groupProject.save
   			end
   		end

		if (!@groupPeople.empty?)
   			@groupPeople.each do |groupPerson|
   				groupPerson.active = false
			    @openAssignments = Assignment.where(:person_id => groupPerson.id, :active => true)
   				if (!@openAssignments.empty?)
   				@openAssignments.each do |openAssignment|
	   				openAssignment.active = false
				    openAssignment.enddate = Time.now
				    openAssignment.save
				    #openAssignment.destroy
				    groupPerson.allocation -= openAssignment.allocation
				    groupPerson.save
	   			end
   				end
   			end
   		end

		if @group.save 
			redirect_to groups_path
		else
			redirect_to edit_group_path
		end
	end

	private
		def set_group
      		@group = Group.find(params[:id])
      		@personnew = Person.new
      		@groups = Group.all
      		@project = Project.new 
    	end

		def group_params
      		params.require(:group).permit(:name, :active)
    	end
end
