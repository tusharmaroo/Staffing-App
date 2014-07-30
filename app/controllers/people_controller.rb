class PeopleController < ApplicationController
	before_action :authenticate_user!
	before_action :set_person, only: [:show, :edit, :update, :destroy]

	def index
		@people = Person.all
	end

	def new
		#@person = Person.new
		#@groups = Group.all 
	end

	def checkMailID
		emailExist = Person.find_by_email(params[:checkmail]).present?
	end

	def create
		@group = Group.find(params[:person][:group_id])
		@person = Person.new(person_params)
		@deviseUser = User.create_new_user(params[:person][:emailid])
		#UserMailer.welcome_email(@personnew).deliver
		if @person.save
			redirect_to group_people_path(@group)
		else
			redirect_to group_people_path(@group)
		end
	end

	def edit
		#@groups = Group.all
	end

	def update
		#@group = Group.find(params[:person][:group_id])
		if @person.update(person_params)
			redirect_to person_path(@person)
		else
			redirect_to person_path(@person)
		end
	end

	def show
		#@assignment = Assignment.new
		#@people = Person.all
		@projects = Project.where(:group_id => @person.group_id) 
		@assignments = Assignment.where(:person_id => @person.id)
		@group = Group.find(@person.group_id)
		#@project = Project.new
	end

	def destroy
		@openAssignments = Assignment.where(:person_id => @person.id, :active => true)
		#@openAssignments = openAssignments.where("enddate > ?", Time.now)
   		if (!@openAssignments.empty?)
   			@openAssignments.each do |openAssignment|
   				openAssignment.deactive
   			end
   		end

		if @person.deactive
			redirect_to person_path(@person)
		else
			redirect_to person_path(@person)
		end
	end

	def enable
		@person = Person.find(params[:person_id])
		@person.update_column :active, true
		#@person.active = true
		if @person.save 
			redirect_to person_path(@person)
		else
			redirect_to person_path(@person)
		end
	end

	private
		def set_person
			@person = Person.find(params[:id])
		end

		def person_params
      		params.require(:person).permit(:name, :skills, :totalExp, :tcsExp, :relExp, :mobilenumber,  :emailid,  :allocation, :interestAreas, :group_id, :active,:location,:PersonalLearnings)
    	end
end
