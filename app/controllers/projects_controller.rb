class ProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all		
	end

	def edit
		@groups = Group.all
	end

	def show
		@group = Group.find(@project.group_id)
		@person = Person.new
	end

	def new
		@project = Project.new
		@groups = Group.all
	end

	def create
		@group = Group.find(params[:project][:group_id])
		@project = Project.new(project_params)
		if @project.save
			redirect_to group_path(@group)
		else
			redirect_to group_path(@group)
		end
	end

	

	def update
		if @project.update(project_params)
			redirect_to project_path(@project)
		else
			redirect_to edit_project_path(@project)
		end
	end

	def destroy
		@project.active = false
		@project.endDate = Time.now
		@group = @project.group_id
		@openAssignments = Assignment.where(:project_id => @project.id)
   		if (!@openAssignments.empty?)
   			@openAssignments.each do |openAssignment|
   				openAssignment.active = false
   				openAssignment.enddate = Time.now
   				@assignedPersons = Person.where(:id => openAssignment.person_id)
   				@assignedPersons.each do |assignedPerson|
   					assignedPerson.allocation = assignedPerson.allocation - openAssignment.allocation
   					assignedPerson.save
   				end
   				openAssignment.save
   			end
   		end
		if @project.save 
			redirect_to group_projects_path(@group)
		else
			redirect_to group_projects_path(@group)
		end
	end

	def enable
		@project = Project.find(params[:project_id])
		@project.active = true
		if @project.save 
			redirect_to projects_path
		else
			redirect_to edit_projects_path
		end
	end

	private
		def set_project
			@project = Project.find(params[:id])
		end

		def project_params
			params.require(:project).permit(:name, :startDate, :endDate, :group_id, :active,:ProjectDetails)
		end
end
