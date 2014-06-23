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

	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else
			redirect_to new_project_path
		end
	end

	def new
		@project = Project.new
		@groups = Group.all
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
		if @project.save 
			redirect_to projects_path
		else
			redirect_to edit_project_path
		end
	end

	private
		def set_project
			@project = Project.find(params[:id])
		end

		def project_params
			params.require(:project).permit(:name, :startDate, :endDate, :group_id, :active)
		end
end
