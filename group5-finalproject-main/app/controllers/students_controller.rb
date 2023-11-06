class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy]
  before_action :is_authorized_user_signed_in?, only: [:edit]
  before_action :authenticate_instructor!, only: [:index, :new, :create]

  def authenticate
    if !current_student?(@student)
      redirect_to student_sessions_new_path
      return
    end
  end
  #Authenticate user login
  def authenticate_student
    @student = Student.find_by(username: params[:session][:username])

    if @student && @student.authenticate(params[:session][:password])  #authenticate is supplied by bcrypt gem
      session[:user_id] = @student.id
      session[:message] = "Student"
      flash[:notice] = "Logged in successfully."
      puts "logged in"
      puts session[:user_id]
      redirect_to :action => "show", :controller => "students", :id => @student.id
    else
      puts @student
      flash.now[:alert] = "Could not log in"
      redirect_to student_sessions_new_path
    end
  end

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    @presentation_events = PresentationEvent.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :username, :password)
    end
end
