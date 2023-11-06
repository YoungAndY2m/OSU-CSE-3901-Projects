class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:edit, :update ]

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
    @team = Team.find(params[:team_id])
    if logged_in?
      @student = Student.find_by(id: session[:student_id])
    end
  end

  # GET /evaluations or /evaluations.json
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1 or /evaluations/1.json
  def show
    @evaluation = Evaluation.find(params[:id])
    puts @evaluation
    @team = Team.find(@evaluation.team_id)
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations or /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)
    
      if @evaluation.save
        redirect_to @evaluation
      end
  
  end

  # PATCH/PUT /evaluations/1 or /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: "Evaluation was successfully updated." }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1 or /evaluations/1.json
  def destroy
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.present?
      @evaluation.destroy
    end
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: "Evaluation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(:attempt, :team_id, :comments, :grade, :student_id)
    end
end
#5093abe