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
  def create
    @assignment = Assignment.new(assignment_params)
    @person = Person.find(params[:assignment][:person_id])
    @person.allocation = @person.allocation + @assignment.allocation
    if @person.save
      if @assignment.save
        redirect_to groups_path
      else
        redirect_to groups_path
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to group_path(@group), notice: 'Assignment was successfully updated.' }
      else
        format.html { redirect_to group_path(@group), notice: 'Assignment updation was not successful.' }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:person_id, :project_id, :billable, :group_id,:allocation)
    end
end
