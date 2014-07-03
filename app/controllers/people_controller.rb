class PeopleController < ApplicationController
	before_action :authenticate_user!
	before_action :set_person, only: [:show, :edit, :update, :destroy]
	def index
		@people = Person.all
	end

	def new
		@personnew = Person.new
		@groups = Group.all 
	end

	def create
		@group = Group.find(params[:person][:group_id])
		@person = Person.new(person_params)
		if @person.save
			#redirect_to people_path
			redirect_to group_path(@group)
		else
			redirect_to group_path(@group)
		end
	end

	def edit
		@groups = Group.all
	end

	def update
		@group = Group.find(params[:person][:group_id])
		if @person.update(person_params)
			redirect_to group_path(@group)
		else
			redirect_to edit_people_path(@person)
		end
	end

	def show
		@assignment = Assignment.new
		@people = Person.all
		@projects = Project.all 
		@assignments = Assignment.where(:person_id => @person.id)
		@group = Group.find(@person.group_id)
		@project = Project.new
	end

	def destroy
		@person.active = false
		@person.allocation = 0
		@openAssignments = Assignment.where(:person_id => @person.id)
   		if (!@openAssignments.empty?)
   			@openAssignments.each do |openAssignment|
   				openAssignment.active = false
   				openAssignment.save
   			end
   		end

		if @person.save 
			redirect_to people_path
		else
			redirect_to edit_people_path
		end
	end

	def enable
		@person = Person.find(params[:person_id])
		@person.active = true
		if @person.save 
			redirect_to people_path
		else
			redirect_to edit_people_path
		end
	end

	private
		def set_person
			@person = Person.find(params[:id])
		end

		def person_params
      		params.require(:person).permit(:name, :skills, :totalExp, :tcsExp, :relExp, :mobilenumber,  :emailid,  :allocation, :interestAreas, :group_id, :active,:location)
    	end
end
