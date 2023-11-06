require 'csv'

class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy evaluate grade]
  before_action :authenticate_instructor!, only: [:new, :edit, :create, :update, :grade]

  #Select student
  #Remove student from old teams
  #Add student to the new team (Model students_teams)
  def addStudentToTeam
    presentation_event = PresentationEvent.find_by()

  end
  #set grade attribute and comment attribute of team to value
  def grade
    @team.grade = params[:grade]
    @team.comment = params[:comment]
  end
  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
    @students = Student.all
    @evals = Evaluation.all
    @evals.to_a
    @evals = @evals.select {|eval| eval.team_id == @team.id}
  end

  
  # GET /teams/new
  def new
    @team = Team.new
    # @students = Student.all
  end

  # GET /teams/1/edit
  def edit
    @students = Student.all
    #@students_teams = Students_Team.all
  end

  def create
    @team = Team.new
    if team_params[:team_name] != nil
      @team.team_name = team_params[:team_name]
    end
    if team_params[:presentation_event_id] != nil
      @team.presentation_event_id = team_params[:presentation_event_id]
      @team.presentation_event_name = PresentationEvent.find(team_params[:presentation_event_id]).event_name
      @team.team_name = @team.presentation_event_name + "-" + team_params[:team_name]
    end
    if team_params['students_attributes'] != nil
      team_params['students_attributes'].each do |student|
        studenti = Student.find(student[1]['id'])
        #studenti= Student.find(value)
        if !@team.students.include? studenti
          @team.students << studenti
        end
      end
    end
    if @team.save
      redirect_to @team
      flash.alert = "Team successfully created"
    else
      redirect_to :back
      flash.alert = "Failed to create team"
    end
  end
  # POST /teams or /teams.json
  

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    if team_params[:team_name] != nil
      @team.team_name = team_params[:team_name]
    end
    if team_params[:presentation_event_id] != nil
      @team.presentation_event_id = team_params[:presentation_event_id]
      @team.presentation_event_name = PresentationEvent.find(team_params[:presentation_event_id]).event_name
    end
    if team_params['students_attributes'] != nil
      team_params['students_attributes'].each do |student|
        studenti = Student.find(student[1]['id'])
        #studenti= Student.find(value)
        if !@team.students.include? studenti
          @team.students << studenti
        end
      end
    end
    if team_params[:grade] != nil
      @team.grade = team_params[:grade]
    end
    if team_params[:comment] != nil
      @team.comment = team_params[:comment]
    end
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #test export to csv
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params

      params.require(:team).permit(:team_name, :presentation_event_name, :grade, :comment, :presentation_event_id, evaluations_attributes: [:id, :_destroy, :attempt],
                                    students_attributes: [:id, :_destroy])
    end
end
