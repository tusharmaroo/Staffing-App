class PeopleController < ApplicationController
	before_action :set_person, only: [:show, :edit, :update, :destroy]
	def index
		@people = Person.all
	end

	def new
		@person = Person.new
		@groups = Group.all 
	end

	def create
		@person = Person.new(person_params)
		if @person.save
			redirect_to people_path
		else
			redirect_to people_new_path
		end
	end

	def edit
		@groups = Group.all
	end

	def update
		if @person.update(person_params)
			redirect_to people_path(@person)
		else
			redirect_to edit_people_path(@person)
		end
	end

	def show
	end

	def destroy
		@person.active = false
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
