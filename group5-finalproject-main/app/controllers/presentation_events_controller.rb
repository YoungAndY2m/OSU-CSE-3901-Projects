class PresentationEventsController < ApplicationController
  before_action :set_presentation_event, only: %i[ show edit update destroy]
  before_action :authenticate_instructor!, only: [:new, :edit, :create, :update]
  before_action :is_authorized_user_signed_in?, only: [:show]

  
  def generate_teams
    #get all student
    #randomly select 8 student from list of student
    @student = Student.all
    @student.shuffle
    @student = @student.to_a
    #Create 5 teams
    #index = 0
    #while @student.length != 0
      #push student into teams @ index%mod 
      #index++
    #Save teams
      teams = []
    for i in 0...5 do
      team = Team.new
      @presentation_event.teams << team
      #team.presentation_event_id = @presentation_event.id
      team.team_name = presentation_event_params[:event_name] + "-Team " +(i+1).to_s
      team.presentation_event_name = presentation_event_params[:event_name]
      teams << team
    end
    index = 0
    while @student.length != 0
      #Randomly remove 5 students from @students
      teams[index % 5].students << @student.pop()
      index += 1
    end
    while teams.length != 0
      team = teams.pop()
      if team.save
        puts "saves teams"
      else
        puts "failed to save team"
      end
    end
  end
  # GET /presentation_events or /presentation_events.json
  def index
    @presentation_events = PresentationEvent.all
    @teams = Team.all
  end

  # GET /presentation_events/1 or /presentation_events/1.json
  def show
    @teams = Team.all
    @teams.to_a
    @teams = @teams.select {|team| team.presentation_event_id == @presentation_event.id}
    @student = Student.find_by(id: session[:student_id])
  end

  # GET /presentation_events/new
  def new
    @presentation_event = PresentationEvent.new
    @teams = Team.all
  end

  # GET /presentation_events/1/edit
  def edit
    @teams = Team.all
  end

  # POST /presentation_events or /presentation_events.json
  def create
    @presentation_event = PresentationEvent.new(presentation_event_params)
    
    generate_teams
    #Create n number of teams from student
    respond_to do |format|
      if @presentation_event.save
        format.html { redirect_to @presentation_event, notice: "Presentation event was successfully created." }
        format.json { render :show, status: :created, location: @presentation_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @presentation_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentation_events/1 or /presentation_events/1.json
  def update
    respond_to do |format|
      if @presentation_event.update(presentation_event_params)
        format.html { redirect_to @presentation_event, notice: "Presentation event was successfully updated." }
        format.json { render :show, status: :ok, location: @presentation_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @presentation_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentation_events/1 or /presentation_events/1.json
  def destroy
    @presentation_event.destroy
    respond_to do |format|
      format.html { redirect_to presentation_events_url, notice: "Presentation event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # testing using data (olivia)
  def presentation_team
    @msg = "hi i made this message"
    @data = params[:data]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation_event
      @presentation_event = PresentationEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presentation_event_params
      params.require(:presentation_event).permit(:event_name, :due, :status,
                                                 teams_attributes: [:id, :_destroy, :team_name])
    end
end
