class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
    @people = Person.all 
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @person = Person.find(params[:assignment][:person_id])
    Rails.logger.info "---------------------------------#{@person.allocation}"
    Rails.logger.info "---------------------------------#{params[:assignment][:allocation]}"
    @temp = @person.allocation + params[:assignment][:allocation].to_i
    @person.allocation += params[:assignment][:allocation].to_i
    if @assignment.save
      Rails.logger.info "========================#{@temp}"
      @person.update_attributes(:allocation => @temp)
      Rails.logger.info "---------------------------------#{@person.allocation}"
      @person.save
      redirect_to assignments_path, :notice => "created"
    else
      redirect_to assignments_path, :notice => 'Not created'
    end
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
    @persons = Person.all
    @projects = Project.all
  end

  # GET /assignments/1/edit
  def edit
    @persons = Person.all
    @projects = Project.all
  end

  # POST /assignments
  # POST /assignments.json
  

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    
      if @assignment.update(assignment_params)
        redirect_to groups_path
      else
        redirect_to groups_path
      end
   
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.active = false
    if @assignment.save 
      redirect_to assignments_path
    else
      redirect_to edit_assignments_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:person_id, :project_id, :billable, :group_id,:allocation,:startdate, :enddate)
    end
end
