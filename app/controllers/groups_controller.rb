class GroupsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_group, only: [:show, :edit, :update, :destroy]
	def index
		@groups = Group.all 
	end

	def new_project

	end

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to groups_path
		else
			redirect_to groups_new_path
		end
	end

	def new
		@group = Group.new
	end

	def show
		@people = Person.where(:group_id => @group.id)
		@assignments = Assignment.all 

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

	def destroy
		@group.active = false
		if @group.save 
			redirect_to groups_path
		else
			redirect_to edit_group_path
		end
	end

	private
		def set_group
      		@group = Group.find(params[:id])
      		@person = Person.new
      		@groups = Group.all
      		@project = Project.new 
    	end

		def group_params
      		params.require(:group).permit(:name, :active)
    	end

end
